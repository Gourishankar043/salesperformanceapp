import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

class AppProgressBar extends StatelessWidget {
  final double value;
  final Color progressColor;
  final Color trackColor;
  final double height;
  final double borderRadius;

  const AppProgressBar({
    super.key,
    required this.value,
    this.progressColor = AppColors.success,
    this.trackColor = AppColors.progressTrack,
    this.height = AppDimensions.progressHeight,
    this.borderRadius = AppDimensions.radiusSmall,
  });

  @override
  Widget build(BuildContext context) {
    final normalizedValue = value.clamp(0.0, 1.0);

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(color: trackColor),
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: normalizedValue,
                child: ColoredBox(color: progressColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}