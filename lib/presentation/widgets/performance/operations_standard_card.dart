
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/performance.dart';

class OperationsStandardCard extends StatelessWidget {
  final Performance performance;

  const OperationsStandardCard({
    super.key,
    required this.performance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacing22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppDimensions.radiusCard),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Op. Standards',
                  style: AppTextStyles.heading.copyWith(
                    fontSize: AppDimensions.fontSize23,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing10,
                  vertical: AppDimensions.spacing8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.accentRedTint,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusSmall,
                  ),
                ),
                child: Text(
                  '${performance.demoDaysPercentage.toStringAsFixed(0)}% Demo days',
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentRed,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing28),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                performance.eventsExecuted.toStringAsFixed(1),
                style: AppTextStyles.metricValue.copyWith(
                  fontSize: AppDimensions.fontSize38,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing6),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: AppDimensions.spacing6,
                ),
                child: Text(
                  'Events Executed',
                  style: AppTextStyles.body.copyWith(
                    fontSize: AppDimensions.fontSize18,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing18),
          _PerformanceBar(
            eventsWithFc: performance.eventsWithFc,
            eventsExecuted: performance.eventsExecuted,
            eventsPlanned: performance.eventsPlanned,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          _Legend(
            eventsWithFc: performance.eventsWithFc,
            eventsExecuted: performance.eventsExecuted,
            eventsPlanned: performance.eventsPlanned,
          ),
          const SizedBox(height: AppDimensions.spacing24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                performance.acceptedLeads.toStringAsFixed(1),
                style: AppTextStyles.metricValue.copyWith(
                  fontSize: AppDimensions.fontSize32,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing8),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: AppDimensions.spacing4,
                ),
                child: Text(
                  'Accepted Leads',
                  style: AppTextStyles.body.copyWith(
                    fontSize: AppDimensions.fontSize16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PerformanceBar extends StatelessWidget {
  final double eventsWithFc;
  final double eventsExecuted;
  final double eventsPlanned;

  const _PerformanceBar({
    required this.eventsWithFc,
    required this.eventsExecuted,
    required this.eventsPlanned,
  });

  @override
  Widget build(BuildContext context) {
    final double total = eventsPlanned <= 0 ? 1 : eventsPlanned;

    final double fcWidth =
    (eventsWithFc / total).clamp(0.0, 1.0);

    final double executedWidth =
    (eventsExecuted / total).clamp(0.0, 1.0);

    final double remainingWidth =
    (1 - executedWidth).clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      child: SizedBox(
        height: AppDimensions.progressHeight,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: (fcWidth * 100).round().clamp(1, 100),
              child: Container(
                color: AppColors.accentRed,
              ),
            ),
            Expanded(
              flex: (executedWidth * 100).round().clamp(1, 100),
              child: Container(
                color: AppColors.progressSecondary,
              ),
            ),
            Expanded(
              flex: (remainingWidth * 100).round().clamp(1, 100),
              child: Container(
                color: AppColors.progressPlanned,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final double eventsWithFc;
  final double eventsExecuted;
  final double eventsPlanned;

  const _Legend({
    required this.eventsWithFc,
    required this.eventsExecuted,
    required this.eventsPlanned,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppDimensions.spacing14,
      runSpacing: AppDimensions.spacing8,
      children: [
        _LegendItem(
          color: AppColors.accentRed,
          text: 'w/ FC ${eventsWithFc.toStringAsFixed(1)}',
        ),
        _LegendItem(
          color: AppColors.progressSecondary,
          text: 'Executed ${eventsExecuted.toStringAsFixed(1)}',
        ),
        _LegendItem(
          color: AppColors.progressPlanned,
          text: 'Planned ${eventsPlanned.toStringAsFixed(1)}',
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({
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
