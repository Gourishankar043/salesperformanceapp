import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../l10n/generated/app_localizations.dart';

class PriorityCategoryChip extends StatelessWidget {
  final String category;
  final bool isSelected;

  const PriorityCategoryChip({
    super.key,
    required this.category,
    this.isSelected = false,
  });

  String _localizedCategory(AppLocalizations l10n) {
    switch (category) {
      case 'Mastering Collaboration':
        return l10n.masteringCollaboration;
      case 'Mastering Sales':
        return l10n.masteringSales;
      default:
        return category;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.75,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing9,
        vertical: AppDimensions.spacing5,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.accentRedTint
            : AppColors.chipBackground,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusSmall,
        ),
      ),
      child: Text(
        _localizedCategory(l10n),
        softWrap: true,
        style: AppTextStyles.caption.copyWith(
          fontSize: AppDimensions.fontSize11,
          fontWeight: FontWeight.w500,
          color: isSelected
              ? AppColors.accentRed
              : AppColors.mutedDark,
        ),
      ),
    );
  }
}