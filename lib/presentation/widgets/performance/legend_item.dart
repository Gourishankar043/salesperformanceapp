
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppDimensions.size9,
          height: AppDimensions.size9,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              AppDimensions.spacing2,
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.spacing6),
        Text(
          text,
          style: AppTextStyles.caption.copyWith(
            fontSize: AppDimensions.fontSize11,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
