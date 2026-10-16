import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool showShadow;
  final Color backgroundColor;
  final BoxBorder? border;

  const AppCard({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.borderRadius = AppDimensions.radiusCard,
    this.showShadow = false,
    this.backgroundColor = AppColors.card,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow: showShadow
            ? const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppDimensions.spacing14,
            offset: Offset(
              0,
              AppDimensions.spacing4,
            ),
          ),
        ]
            : null,
      ),
      child: child,
    );
  }
}