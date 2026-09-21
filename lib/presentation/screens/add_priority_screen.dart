import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/di/injection.dart';
import '../bloc/priority/priority_bloc.dart';
import '../bloc/priority/priority_event.dart';
import '../bloc/priority/priority_state.dart';
import '../widgets/priority_card.dart';

class AddPriorityScreen extends StatelessWidget {
  const AddPriorityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PriorityBloc>()..add(LoadPriorities()),
      child: const _AddPriorityView(),
    );
  }
}

class _AddPriorityView extends StatefulWidget {
  const _AddPriorityView();

  @override
  State<_AddPriorityView> createState() => _AddPriorityViewState();
}

class _AddPriorityViewState extends State<_AddPriorityView> {
  final Set<String> selectedIds = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategic Priorities'),
      ),
      body: BlocConsumer<PriorityBloc, PriorityState>(
        listener: (context, state) {
          if (state is PrioritySaved) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Priorities saved'),
              ),
            );
          }

          if (state is PriorityError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PriorityLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PriorityLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.priorities.length,
                    itemBuilder: (context, index) {
                      final priority = state.priorities[index];
                      final selected = selectedIds.contains(priority.id);

                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (selected) {
                              selectedIds.remove(priority.id);
                            } else if (selectedIds.length < 3) {
                              selectedIds.add(priority.id);
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: selected,
                              onChanged: (_) {
                                setState(() {
                                  if (selected) {
                                    selectedIds.remove(priority.id);
                                  } else if (selectedIds.length < 3) {
                                    selectedIds.add(priority.id);
                                  }
                                });
                              },
                            ),
                            Expanded(
                              child: PriorityCard(
                                priority: priority,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedIds.isEmpty
                          ? null
                          : () {
                        context.read<PriorityBloc>().add(
                          SavePrioritySelection(
                            selectedIds.toList(),
                          ),
                        );
                      },
                      child: const Text('Save Priorities'),
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}