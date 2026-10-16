import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_progress_bar.dart';
import '../../../core/widgets/app_status_badge.dart';
import '../../../domain/entities/performance.dart';
import '../../../l10n/generated/app_localizations.dart';

class PerformanceCard extends StatelessWidget {
  final Performance performance;

  const PerformanceCard({
    super.key,
    required this.performance,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final percentage = performance.netSalesPercentage / 100;

    return AppCard(
      padding: const EdgeInsets.all(AppDimensions.spacing24),
      showShadow: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 360;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isNarrow)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeading(l10n),
                    const SizedBox(
                      height: AppDimensions.spacing12,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildBadge(l10n),
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildHeading(l10n),
                    ),
                    const SizedBox(
                      width: AppDimensions.spacing8,
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: _buildBadge(l10n),
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: AppDimensions.spacing30,
              ),
              if (isNarrow)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Value(
                      value: _formatCurrency(
                        performance.netSalesAchieved,
                      ),
                      label: l10n.achieved,
                    ),
                    const SizedBox(
                      height: AppDimensions.spacing16,
                    ),
                    _Value(
                      value: _formatCurrency(
                        performance.netSalesPlan,
                      ),
                      label: l10n.plan,
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _Value(
                        value: _formatCurrency(
                          performance.netSalesAchieved,
                        ),
                        label: l10n.achieved,
                      ),
                    ),
                    const SizedBox(
                      width: AppDimensions.spacing12,
                    ),
                    Expanded(
                      child: _Value(
                        value: _formatCurrency(
                          performance.netSalesPlan,
                        ),
                        label: l10n.plan,
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: AppDimensions.spacing22,
              ),
              AppProgressBar(
                value: percentage,
                progressColor: AppColors.success,
                trackColor: AppColors.progressTrack,
                height: AppDimensions.progressHeight,
                borderRadius: AppDimensions.radiusSmall,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeading(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.netSales,
          softWrap: true,
          style: AppTextStyles.sectionTitle.copyWith(
            fontSize: AppDimensions.fontSize25,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(
          height: AppDimensions.spacing4,
        ),
        Text(
          l10n.ytd,
          softWrap: true,
          style: AppTextStyles.body.copyWith(
            fontSize: AppDimensions.fontSize18,
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(AppLocalizations l10n) {
    return AppStatusBadge(
      label:
      '${performance.netSalesPercentage.toStringAsFixed(0)}% ${l10n.ofPlan}',
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
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.metricValue.copyWith(
            fontSize: AppDimensions.fontSize32,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(
          height: AppDimensions.spacing4,
        ),
        Text(
          label,
          softWrap: true,
          style: AppTextStyles.body.copyWith(
            fontSize: AppDimensions.fontSize17,
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }
}