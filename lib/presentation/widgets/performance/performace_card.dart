
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_progress_bar.dart';
import '../../../core/widgets/app_status_badge.dart';
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

    return AppCard(
      padding: const EdgeInsets.all(AppDimensions.spacing24),
      showShadow: true,
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
                  const SizedBox(
                    height: AppDimensions.spacing4,
                  ),
                  Text(
                    'YTD',
                    style: AppTextStyles.body.copyWith(
                      fontSize: AppDimensions.fontSize18,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
              AppStatusBadge(
                label:
                '${performance.netSalesPercentage.toStringAsFixed(0)}% of plan',
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Value(
                value: _formatCurrency(
                  performance.netSalesAchieved,
                ),
                label: 'Achieved',
              ),
              _Value(
                value: _formatCurrency(
                  performance.netSalesPlan,
                ),
                label: 'Plan',
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing22),
          AppProgressBar(
            value: percentage,
            progressColor: AppColors.success,
            trackColor: AppColors.progressTrack,
            height: AppDimensions.progressHeight,
            borderRadius: AppDimensions.radiusSmall,
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
