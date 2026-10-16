import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_status_badge.dart';
import '../../../domain/entities/performance.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'legend_item.dart';

class OperationsStandardCard extends StatelessWidget {
  final Performance performance;

  const OperationsStandardCard({
    super.key,
    required this.performance,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppCard(
      padding: const EdgeInsets.all(AppDimensions.spacing22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final badge = AppStatusBadge(
                label:
                '${performance.demoDaysPercentage.toStringAsFixed(0)}% ${l10n.demoDays}',
                backgroundColor: AppColors.accentRedTint,
                textColor: AppColors.accentRed,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing10,
                  vertical: AppDimensions.spacing8,
                ),
              );

              final title = Text(
                l10n.operationsStandards,
                softWrap: true,
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppDimensions.fontSize23,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              );

              if (constraints.maxWidth < 360) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    const SizedBox(
                      height: AppDimensions.spacing8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: badge,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: title),
                  const SizedBox(
                    width: AppDimensions.spacing8,
                  ),
                  Flexible(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: badge,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: AppDimensions.spacing28),
          _MetricLabelRow(
            value: performance.eventsExecuted.toStringAsFixed(1),
            label: l10n.eventsExecuted,
            valueFontSize: AppDimensions.fontSize38,
            labelFontSize: AppDimensions.fontSize18,
          ),
          const SizedBox(height: AppDimensions.spacing18),
          _PerformanceBar(
            eventsWithFc: performance.eventsWithFc,
            eventsExecuted: performance.eventsExecuted,
            eventsPlanned: performance.eventsPlanned,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          _PerformanceLegend(
            eventsWithFc: performance.eventsWithFc,
            eventsExecuted: performance.eventsExecuted,
            eventsPlanned: performance.eventsPlanned,
            l10n: l10n,
          ),
          const SizedBox(height: AppDimensions.spacing24),
          _MetricLabelRow(
            value: performance.acceptedLeads.toStringAsFixed(1),
            label: l10n.acceptedLeads,
            valueFontSize: AppDimensions.fontSize32,
            labelFontSize: AppDimensions.fontSize16,
          ),
        ],
      ),
    );
  }
}

class _MetricLabelRow extends StatelessWidget {
  final String value;
  final String label;
  final double valueFontSize;
  final double labelFontSize;

  const _MetricLabelRow({
    required this.value,
    required this.label,
    required this.valueFontSize,
    required this.labelFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: AppDimensions.spacing8,
      runSpacing: AppDimensions.spacing4,
      children: [
        Text(
          value,
          style: AppTextStyles.metricValue.copyWith(
            fontSize: valueFontSize,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppDimensions.spacing4,
          ),
          child: Text(
            label,
            softWrap: true,
            style: AppTextStyles.body.copyWith(
              fontSize: labelFontSize,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
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
    final total = eventsPlanned <= 0 ? 1.0 : eventsPlanned;

    final fcWidth = (eventsWithFc / total).clamp(0.0, 1.0);
    final executedWidth = (eventsExecuted / total).clamp(0.0, 1.0);
    final remainingWidth = (1 - executedWidth).clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        AppDimensions.radiusSmall,
      ),
      child: SizedBox(
        height: AppDimensions.progressHeight,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: (fcWidth * 100).round().clamp(1, 100),
              child: const ColoredBox(
                color: AppColors.accentRed,
              ),
            ),
            Expanded(
              flex: (executedWidth * 100).round().clamp(1, 100),
              child: const ColoredBox(
                color: AppColors.progressSecondary,
              ),
            ),
            Expanded(
              flex: (remainingWidth * 100).round().clamp(1, 100),
              child: const ColoredBox(
                color: AppColors.progressPlanned,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PerformanceLegend extends StatelessWidget {
  final double eventsWithFc;
  final double eventsExecuted;
  final double eventsPlanned;
  final AppLocalizations l10n;

  const _PerformanceLegend({
    required this.eventsWithFc,
    required this.eventsExecuted,
    required this.eventsPlanned,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppDimensions.spacing14,
      runSpacing: AppDimensions.spacing8,
      children: [
        LegendItem(
          color: AppColors.accentRed,
          text: '${l10n.withFc} ${eventsWithFc.toStringAsFixed(1)}',
        ),
        LegendItem(
          color: AppColors.progressSecondary,
          text: '${l10n.executed} ${eventsExecuted.toStringAsFixed(1)}',
        ),
        LegendItem(
          color: AppColors.progressPlanned,
          text: '${l10n.planned} ${eventsPlanned.toStringAsFixed(1)}',
        ),
      ],
    );
  }
}