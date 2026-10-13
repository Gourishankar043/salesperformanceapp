import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/di/injection.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';
import '../../domain/entities/priority.dart';
import '../bloc/priority/priority_bloc.dart';
import '../bloc/priority/priority_event.dart';
import '../bloc/priority/priority_state.dart';
import '../widgets/priority/priority_card.dart';

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
      create: (_) =>
      getIt<PriorityBloc>()
        ..add(LoadPriorities()),
      child: BlocConsumer<PriorityBloc, PriorityState>(
        listener: (context, state) {
          if (state is PrioritySaved) {
            Navigator.pop(context, state.priorities);
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
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            );
          }

          if (state is PriorityLoaded) {
            return _buildScreen(context, state.priorities);
          }

          return const Scaffold(
            body: SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildScreen(BuildContext context,
      List<Priority> priorities,) {
    return Scaffold(
      backgroundColor: AppColors.backgroundAlt,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.spacing16,
                  AppDimensions.spacing18,
                  AppDimensions.spacing16,
                  AppDimensions.spacing20,
                ),
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Add strategic priorities',
                          style: AppTextStyles.pageTitle,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: AppDimensions.size42,
                          height: AppDimensions.size42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.borderStrong,
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.textPrimary,
                            size: AppDimensions.iconLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacing14),
                  const Text(
                    'These priorities generate relevant coaching actions for each field ride.',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: AppDimensions.spacing24),
                  ...priorities.map((priority) {
                    final isSelected =
                    _selectedPriorityIds.contains(priority.id);

                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppDimensions.spacing12,
                      ),
                      child: PriorityCard(
                        priority: priority,
                        isSelected: isSelected,
                        onTap: () => _togglePriority(priority),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.spacing16,
                AppDimensions.spacing12,
                AppDimensions.spacing16,
                AppDimensions.spacing16,
              ),
              color: AppColors.backgroundAlt,
              child: SizedBox(
                height: AppDimensions.spacing52,
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
                    backgroundColor: AppColors.accentRed,
                    disabledBackgroundColor: AppColors.borderStrong,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusPill,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Save',
                    style: AppTextStyles.button,
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