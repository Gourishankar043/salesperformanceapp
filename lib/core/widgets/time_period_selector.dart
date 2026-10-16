import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';
import '../../l10n/generated/app_localizations.dart';

class TimePeriodSelector extends StatelessWidget {
  final String selectedPeriod;
  final ValueChanged<String> onChanged;

  const TimePeriodSelector({
    super.key,
    required this.selectedPeriod,
    required this.onChanged,
  });

  static const List<String> periods = [
    'Bi-weekly',
    'Month',
    'Quarter',
    'Year',
  ];

  String _localizedPeriod(
      String period,
      AppLocalizations l10n,
      ) {
    switch (period) {
      case 'Bi-weekly':
        return l10n.biweekly;
      case 'Month':
        return l10n.month;
      case 'Quarter':
        return l10n.quarter;
      case 'Year':
        return l10n.year;
      default:
        return period;
    }
  }

  Widget _buildPeriodItem(
      BuildContext context,
      String period,
      AppLocalizations l10n,
      ) {
    final bool isSelected = selectedPeriod == period;

    return GestureDetector(
      onTap: () => onChanged(period),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        constraints: const BoxConstraints(
          minHeight: AppDimensions.spacing36,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing6,
          vertical: AppDimensions.spacing4,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusPill,
          ),
          boxShadow: isSelected
              ? const [
            BoxShadow(
              color: AppColors.shadowStrong,
              blurRadius: AppDimensions.spacing3,
              offset: Offset(
                0,
                AppDimensions.spacing2 / 2,
              ),
            ),
          ]
              : null,
        ),
        child: Text(
          _localizedPeriod(period, l10n),
          textAlign: TextAlign.center,
          softWrap: true,
          style: AppTextStyles.caption.copyWith(
            fontSize: AppDimensions.fontSize12,
            fontWeight:
            isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? AppColors.textPrimary
                : AppColors.muted,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool useTwoRows = constraints.maxWidth < 320;

        return Container(
          padding: const EdgeInsets.all(
            AppDimensions.spacing4,
          ),
          decoration: BoxDecoration(
            color: AppColors.chipBackground,
            borderRadius: BorderRadius.circular(
              AppDimensions.radiusPill,
            ),
          ),
          child: useTwoRows
              ? Wrap(
            spacing: AppDimensions.spacing4,
            runSpacing: AppDimensions.spacing4,
            children: periods.map((period) {
              return SizedBox(
                width: (constraints.maxWidth -
                    AppDimensions.spacing20) /
                    2,
                child: _buildPeriodItem(
                  context,
                  period,
                  l10n,
                ),
              );
            }).toList(),
          )
              : Row(
            children: periods.map((period) {
              return Expanded(
                child: _buildPeriodItem(
                  context,
                  period,
                  l10n,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}