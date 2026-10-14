
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';

class AppStatusBadge extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  const AppStatusBadge({
    super.key,
    required this.label,
    this.backgroundColor = AppColors.successSoft,
    this.textColor = AppColors.successDark,
    this.fontSize = AppDimensions.fontSize14,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppDimensions.spacing10,
      vertical: AppDimensions.spacing6,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusSmall,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodyMedium.copyWith(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
