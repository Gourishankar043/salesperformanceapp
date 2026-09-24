import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/di/injection.dart';
import '../../domain/entities/priority.dart';
import '../bloc/priority/priority_bloc.dart';
import '../bloc/priority/priority_event.dart';
import '../bloc/priority/priority_state.dart';
import '../widgets/priority_card.dart';

class AddPriorityScreen extends StatefulWidget {
  const AddPriorityScreen({super.key});

  @override
  State<AddPriorityScreen> createState() => _AddPriorityScreenState();
}

class _AddPriorityScreenState extends State<AddPriorityScreen> {
  final Set<String> _selectedPriorityIds = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PriorityBloc>()..add(LoadPriorities()),
      child: BlocConsumer<PriorityBloc, PriorityState>(
        listener: (context, state) {
          if (state is PrioritySaved) {
            Navigator.pop(
              context,
              state.priorities,
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
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is PriorityError) {
            return Scaffold(
              body: Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }

          if (state is PriorityLoaded) {
            return _buildScreen(
              context,
              state.priorities,
            );
          }

          return const Scaffold(
            body: SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildScreen(
      BuildContext context,
      List<Priority> priorities,
      ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  18,
                  16,
                  20,
                ),
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Add strategic priorities',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF202124),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFFD8D8D8),
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Color(0xFF202124),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'These priorities generate relevant coaching actions for each field ride.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: Color(0xFF777777),
                    ),
                  ),

                  const SizedBox(height: 24),

                  ...priorities.map(
                        (priority) {
                      final isSelected =
                      _selectedPriorityIds.contains(priority.id);

                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: PriorityCard(
                          priority: priority,
                          isSelected: isSelected,
                          onTap: () {
                            _togglePriority(priority);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                16,
                12,
                16,
                16,
              ),
              color: const Color(0xFFF7F8FA),
              child: SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedPriorityIds.isEmpty
                      ? null
                      : () {
                    context.read<PriorityBloc>().add(
                      SavePrioritySelection(
                        _selectedPriorityIds.toList(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE0001B),
                    disabledBackgroundColor:
                    const Color(0xFFD9D9D9),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    '保存',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePriority(Priority priority) {
    setState(() {
      if (_selectedPriorityIds.contains(priority.id)) {
        _selectedPriorityIds.remove(priority.id);
      } else {
        if (_selectedPriorityIds.length >= 3) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'You can select up to 3 priorities.',
              ),
            ),
          );
          return;
        }

        _selectedPriorityIds.add(priority.id);
      }
    });
  }
}