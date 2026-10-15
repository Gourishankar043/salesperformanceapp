
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.sectionTitle.copyWith(
              fontSize: AppDimensions.fontSize30,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        if (showLastUpdated) ...[
          const SizedBox(width: AppDimensions.spacing8),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.sync,
                  size: AppDimensions.iconSmall,
                  color: AppColors.muted,
                ),
                const SizedBox(
                  width: AppDimensions.spacing5,
                ),
                Flexible(
                  child: Text(
                    updatedText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppDimensions.fontSize12,
                      color: AppColors.muted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
