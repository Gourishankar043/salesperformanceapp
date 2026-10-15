import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';
import '../../l10n/generated/app_localizations.dart';

class MyDayScreen extends StatelessWidget {
  const MyDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.myDay),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppDimensions.spacing16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.today,
              style: AppTextStyles.sectionTitle,
            ),
            const SizedBox(
              height: AppDimensions.spacing6,
            ),
            Text(
              l10n.dailyActivitiesDescription,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(
              height: AppDimensions.spacing24,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(
                AppDimensions.spacing20,
              ),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radius14,
                ),
                border: Border.all(
                  color: AppColors.border,
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.today_outlined,
                    size: AppDimensions.size40,
                    color: AppColors.primary,
                  ),
                  const SizedBox(
                    height: AppDimensions.spacing12,
                  ),
                  Text(
                    l10n.noActivitiesToday,
                    style: AppTextStyles.heading,
                  ),
                  const SizedBox(
                    height: AppDimensions.spacing6,
                  ),
                  Text(
                    l10n.plannedActivitiesDescription,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}