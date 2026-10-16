import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_progress_bar.dart';
import '../../../core/widgets/app_status_badge.dart';
import '../../../l10n/generated/app_localizations.dart';

class TeamOverviewCard extends StatelessWidget {
  const TeamOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isCompact = screenWidth < 600;

    return AppCard(
      padding: EdgeInsets.fromLTRB(
        isCompact
            ? AppDimensions.spacing16
            : AppDimensions.spacing30,
        isCompact
            ? AppDimensions.spacing20
            : AppDimensions.spacing28,
        isCompact
            ? AppDimensions.spacing16
            : AppDimensions.spacing30,
        AppDimensions.spacing24,
      ),
      showShadow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.netSales,
                      softWrap: true,
                      style: AppTextStyles.sectionTitle.copyWith(
                        fontSize: isCompact
                            ? AppDimensions.fontSize20
                            : AppDimensions.fontSize25,
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
                ),
              ),
              const SizedBox(width: AppDimensions.spacing8),
              Flexible(
                child: AppStatusBadge(
                  label: '120% ${l10n.abovePlan}',
                  fontSize: AppDimensions.fontSize15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppDimensions.spacing28,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _SalesValue(
                  value: '¥5.28M',
                  label: l10n.achieved,
                  compact: isCompact,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing12),
              Expanded(
                child: _SalesValue(
                  value: '¥4.41M',
                  label: l10n.plan,
                  compact: isCompact,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppDimensions.spacing22,
          ),
          const AppProgressBar(
            value: 1,
            progressColor: AppColors.success,
            trackColor: AppColors.progressTrack,
          ),
        ],
      ),
    );
  }
}

class _SalesValue extends StatelessWidget {
  final String value;
  final String label;
  final bool compact;

  const _SalesValue({
    required this.value,
    required this.label,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          softWrap: true,
          style: AppTextStyles.metricValue.copyWith(
            fontSize: compact
                ? AppDimensions.fontSize25
                : AppDimensions.fontSize32,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(
          height: AppDimensions.spacing3,
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