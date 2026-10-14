
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../domain/entities/priority.dart';
import 'priority_card.dart';

class StrategicPrioritiesSection extends StatelessWidget {
  final String memberName;
  final List<Priority> priorities;
  final VoidCallback onEdit;

  const StrategicPrioritiesSection({
    super.key,
    required this.memberName,
    required this.priorities,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Strategic Priorities',
                style: AppTextStyles.sectionTitle.copyWith(
                  fontSize: AppDimensions.fontSize30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            GestureDetector(
              onTap: onEdit,
              child: Container(
                width: AppDimensions.spacing54,
                height: AppDimensions.spacing54,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.borderStrong,
                  ),
                ),
                child: const Icon(
                  Icons.edit,
                  size: AppDimensions.iconMedium,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacing4),
        Text(
          '$memberName\'s focus for the next 3–6 months.',
          style: AppTextStyles.body.copyWith(
            fontSize: AppDimensions.fontSize14,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: AppDimensions.spacing18),

        // Reusable card for today's priorities.
        AppCard(
          padding: const EdgeInsets.fromLTRB(
            AppDimensions.spacing14,
            AppDimensions.spacing20,
            AppDimensions.spacing14,
            AppDimensions.spacing16,
          ),
          borderRadius: AppDimensions.radiusLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Priorities",
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppDimensions.fontSize20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppDimensions.spacing18),
              if (priorities.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.spacing20,
                  ),
                  child: Center(
                    child: Text(
                      'No priorities selected',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ),
                )
              else
                ...List.generate(
                  priorities.length,
                      (index) {
                    final priority = priorities[index];

                    return Column(
                      children: [
                        PriorityCard(
                          priority: priority,
                          isSelected: true,
                          onTap: () {},
                        ),
                        if (index != priorities.length - 1)
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppDimensions.spacing12,
                            ),
                            child: Divider(
                              height: 1,
                              color: AppColors.border,
                            ),
                          ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.spacing18),

        // Reusable card for priorities history.
        AppCard(
          padding: const EdgeInsets.all(
            AppDimensions.spacing18,
          ),
          borderRadius: AppDimensions.radiusLarge,
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Priorities History',
                      style: AppTextStyles.heading,
                    ),
                    SizedBox(height: AppDimensions.spacing10),
                    Text(
                      '3 Open     0 Completed',
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.spacing40,
                height: AppDimensions.spacing40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.borderStrong,
                  ),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
