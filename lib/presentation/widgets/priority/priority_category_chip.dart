import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';

class PriorityCategoryChip extends StatelessWidget {
  final String category;
  final bool isSelected;

  const PriorityCategoryChip({
    super.key,
    required this.category,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing9,
        vertical: AppDimensions.spacing5,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.accentRedTint
            : AppColors.chipBackground,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusSmall,
        ),
      ),
      child: Text(
        category,
        style: AppTextStyles.caption.copyWith(
          fontSize: AppDimensions.fontSize11,
          fontWeight: FontWeight.w500,
          color: isSelected
              ? AppColors.accentRed
              : AppColors.mutedDark,
        ),
      ),
    );
  }
}