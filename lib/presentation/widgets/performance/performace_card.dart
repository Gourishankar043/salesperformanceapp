
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/performance.dart';

class PerformanceCard extends StatelessWidget {
  final Performance performance;

  const PerformanceCard({
    super.key,
    required this.performance,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = performance.netSalesPercentage / 100;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacing24),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppDimensions.radiusCard),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppDimensions.spacing14,
            offset: Offset(0, AppDimensions.spacing4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Net Sales',
                    style: AppTextStyles.sectionTitle.copyWith(
                      fontSize: AppDimensions.fontSize25,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacing4),
                  Text(
                    'YTD',
                    style: AppTextStyles.body.copyWith(
                      fontSize: AppDimensions.fontSize18,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
              _AchievementBadge(
                percentage: performance.netSalesPercentage,
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Value(
                value: _formatCurrency(performance.netSalesAchieved),
                label: 'Achieved',
              ),
              _Value(
                value: _formatCurrency(performance.netSalesPlan),
                label: 'Plan',
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing22),
          _SalesProgress(
            value: percentage.clamp(0.0, 1.0),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double value) {
    if (value >= 1000000) {
      return '¥${(value / 1000000).toStringAsFixed(2)}M';
    }

    if (value >= 1000) {
      return '¥${(value / 1000).toStringAsFixed(0)}K';
    }

    return '¥${value.toStringAsFixed(0)}';
  }
}

class _AchievementBadge extends StatelessWidget {
  final double percentage;

  const _AchievementBadge({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing10,
        vertical: AppDimensions.spacing6,
      ),
      decoration: BoxDecoration(
        color: AppColors.successSoft,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Text(
        '${percentage.toStringAsFixed(0)}% of plan',
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.successDark,
          fontSize: AppDimensions.fontSize14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _Value extends StatelessWidget {
  final String value;
  final String label;

  const _Value({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTextStyles.metricValue.copyWith(
            fontSize: AppDimensions.fontSize32,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacing4),
        Text(
          label,
          style: AppTextStyles.body.copyWith(
            fontSize: AppDimensions.fontSize17,
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }
}

class _SalesProgress extends StatelessWidget {
  final double value;

  const _SalesProgress({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.progressHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.progressTrack,
            ),
            FractionallySizedBox(
              widthFactor: value,
              alignment: Alignment.centerLeft,
              child: Container(
                color: AppColors.success,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
