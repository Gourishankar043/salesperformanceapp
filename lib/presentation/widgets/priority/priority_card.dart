import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/priority.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'priority_category_chip.dart';

class PriorityCard extends StatelessWidget {
  final Priority priority;
  final bool isSelected;
  final VoidCallback onTap;

  const PriorityCard({
    super.key,
    required this.priority,
    required this.isSelected,
    required this.onTap,
  });

  String _localizedTitle(AppLocalizations l10n) {
    switch (priority.title) {
      case 'Leverage references & peers':
        return l10n.leverageReferencesPeers;
      case 'Win back dormant accounts':
        return l10n.winBackDormantAccounts;
      case 'Improve cross-team handovers':
        return l10n.improveCrossTeamHandovers;
      case 'Strength consumables attach':
        return l10n.strengthConsumablesAttach;
      case 'Grow fleet penetration':
        return l10n.growFleetPenetration;
      default:
        return priority.title;
    }
  }

  String _localizedDescription(AppLocalizations l10n) {
    switch (priority.description) {
      case 'Use proof and peers to close.':
        return l10n.useProofAndPeers;
      case 'Reactivate accounts before they churn.':
        return l10n.reactivateAccounts;
      case 'Fast, complete handovers to every team.':
        return l10n.fastCompleteHandovers;
      case 'Attach blades and anchors to deals.':
        return l10n.attachBladesAnchorsDescription;
      case 'Make Fleet part of every conversation.':
        return l10n.fleetConversationDescription;
      default:
        return priority.description;
    }
  }

  String _localizedCategory(AppLocalizations l10n) {
    switch (priority.category) {
      case 'Mastering Collaboration':
        return l10n.masteringCollaboration;
      case 'Mastering Sales':
        return l10n.masteringSales;
      case 'Mastering Offerings':
        return l10n.masteringOfferings;
      default:
        return priority.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(
          bottom: AppDimensions.spacing12,
        ),
        padding: const EdgeInsets.all(
          AppDimensions.spacing16,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accentRedLight
              : AppColors.card,
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusLarge,
          ),
          border: Border.all(
            color: isSelected
                ? AppColors.accentRed
                : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriorityCategoryChip(
                    category: _localizedCategory(l10n),
                    isSelected: isSelected,
                  ),
                  const SizedBox(
                    height: AppDimensions.spacing10,
                  ),
                  Text(
                    _localizedTitle(l10n),
                    style: AppTextStyles.heading.copyWith(
                      fontSize: AppDimensions.fontSize16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.accentRed
                          : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimensions.spacing5,
                  ),
                  Text(
                    _localizedDescription(l10n),
                    style: AppTextStyles.body.copyWith(
                      fontSize: AppDimensions.fontSize13,
                      height: 1.35,
                      color: isSelected
                          ? AppColors.accentRed
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: AppDimensions.spacing12,
            ),
            Container(
              width: AppDimensions.size24,
              height: AppDimensions.size24,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.accentRed
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusSmall,
                ),
                border: Border.all(
                  color: isSelected
                      ? AppColors.accentRed
                      : AppColors.mutedBorder,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(
                Icons.check,
                size: AppDimensions.size17,
                color: AppColors.white,
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}