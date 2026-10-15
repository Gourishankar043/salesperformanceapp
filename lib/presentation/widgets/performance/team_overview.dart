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

    return AppCard(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.spacing30,
        AppDimensions.spacing28,
        AppDimensions.spacing30,
        AppDimensions.spacing24,
      ),
      showShadow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.netSales,
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
                    style: AppTextStyles.body.copyWith(
                      fontSize: AppDimensions.fontSize18,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
              AppStatusBadge(
                label: '120% ${l10n.abovePlan}',
                fontSize: AppDimensions.fontSize15,
              ),
            ],
          ),
          const SizedBox(
            height: AppDimensions.spacing34,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SalesValue(
                value: '¥5.28M',
                label: l10n.achieved,
              ),
              _SalesValue(
                value: '¥4.41M',
                label: l10n.plan,
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

  const _SalesValue({
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
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(
          height: AppDimensions.spacing3,
        ),
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