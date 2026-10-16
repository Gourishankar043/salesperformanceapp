import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';

class AppSectionHeader extends StatelessWidget {
  final String title;
  final bool showLastUpdated;
  final String? lastUpdatedText;

  const AppSectionHeader({
    super.key,
    required this.title,
    this.showLastUpdated = true,
    this.lastUpdatedText,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final updatedText = lastUpdatedText ?? l10n.lastUpdated;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isCompact = screenWidth < 400;

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppDimensions.spacing8,
      runSpacing: AppDimensions.spacing8,
      children: [
        SizedBox(
          width: showLastUpdated
              ? (screenWidth < 400
              ? screenWidth - AppDimensions.spacing32
              : screenWidth * 0.55)
              : double.infinity,
          child: Text(
            title,
            softWrap: true,
            style: AppTextStyles.sectionTitle.copyWith(
              fontSize: isCompact
                  ? AppDimensions.fontSize23
                  : AppDimensions.fontSize30,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        if (showLastUpdated)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.sync,
                size: AppDimensions.iconSmall,
                color: AppColors.muted,
              ),
              const SizedBox(width: AppDimensions.spacing5),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: screenWidth < 400
                      ? screenWidth - (AppDimensions.spacing32 * 2)
                      : screenWidth * 0.4,
                ),
                child: Text(
                  updatedText,
                  softWrap: true,
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppDimensions.fontSize12,
                    color: AppColors.muted,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}