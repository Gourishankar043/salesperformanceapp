
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';

class TeamOverviewCard extends StatelessWidget {
  const TeamOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.spacing30,
        AppDimensions.spacing28,
        AppDimensions.spacing30,
        AppDimensions.spacing24,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusCard,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppDimensions.spacing14,
            offset: Offset(
              0,
              AppDimensions.spacing4,
            ),
          ),
        ],
      ),
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
              const _StatusBadge(),
            ],
          ),
          const SizedBox(
            height: AppDimensions.spacing34,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SalesValue(
                value: '¥5.28M',
                label: 'Achieved',
              ),
              _SalesValue(
                value: '¥4.41M',
                label: 'Plan',
              ),
            ],
          ),
          const SizedBox(
            height: AppDimensions.spacing22,
          ),
          const _ProgressBar(),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing10,
        vertical: AppDimensions.spacing6,
      ),
      decoration: BoxDecoration(
        color: AppColors.successSoft,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusSmall,
        ),
      ),
      child: Text(
        '120% Above plan',
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.successDark,
          fontWeight: FontWeight.w700,
          fontSize: AppDimensions.fontSize15,
        ),
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

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        AppDimensions.radiusSmall,
      ),
      child: Container(
        height: AppDimensions.progressHeight,
        color: AppColors.progressTrack,
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 1,
          child: Container(
            color: AppColors.success,
          ),
        ),
      ),
    );
  }
}
