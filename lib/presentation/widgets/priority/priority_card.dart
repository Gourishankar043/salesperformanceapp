import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/priority.dart';
import 'priority_category_chip.dart';

class PriorityCard extends StatelessWidget {
  final Priority priority;
  final bool isSelected;
  final VoidCallback onTap;

  const PriorityCard({
    super.key,
    required this.priority,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(
          bottom: AppDimensions.spacing12,
        ),
        padding: const EdgeInsets.all(
          AppDimensions.spacing16,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accentRedLight
              : AppColors.card,
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusLarge,
          ),
          border: Border.all(
            color: isSelected
                ? AppColors.accentRed
                : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriorityCategoryChip(
                    category: priority.category,
                    isSelected: isSelected,
                  ),
                  const SizedBox(
                    height: AppDimensions.spacing10,
                  ),
                  Text(
                    priority.title,
                    style: AppTextStyles.heading.copyWith(
                      fontSize: AppDimensions.fontSize16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.accentRed
                          : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimensions.spacing5,
                  ),
                  Text(
                    priority.description,
                    style: AppTextStyles.body.copyWith(
                      fontSize: AppDimensions.fontSize13,
                      height: 1.35,
                      color: isSelected
                          ? AppColors.accentRed
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: AppDimensions.spacing12,
            ),
            Container(
              width: AppDimensions.size24,
              height: AppDimensions.size24,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.accentRed
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusSmall,
                ),
                border: Border.all(
                  color: isSelected
                      ? AppColors.accentRed
                      : AppColors.mutedBorder,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(
                Icons.check,
                size: AppDimensions.size17,
                color: AppColors.white,
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}