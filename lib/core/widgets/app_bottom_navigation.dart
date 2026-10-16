import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../../l10n/generated/app_localizations.dart';

class AppBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isCompact = screenWidth < 360;

    return NavigationBar(
      height: AppDimensions.navigationHeight,
      backgroundColor: AppColors.card,
      elevation: AppDimensions.spacing8,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelBehavior: isCompact
          ? NavigationDestinationLabelBehavior.onlyShowSelected
          : NavigationDestinationLabelBehavior.alwaysShow,
      destinations: [
        NavigationDestination(
          icon: const Icon(
            Icons.home_outlined,
            color: AppColors.textSecondary,
          ),
          selectedIcon: const Icon(
            Icons.home,
            color: AppColors.accentRed,
          ),
          label: l10n.home,
        ),
        NavigationDestination(
          icon: const Icon(
            Icons.chat_bubble_outline,
            color: AppColors.textSecondary,
          ),
          selectedIcon: const Icon(
            Icons.chat_bubble,
            color: AppColors.textSecondary,
          ),
          label: l10n.chatbot,
        ),
        NavigationDestination(
          icon: const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.textSecondary,
          ),
          selectedIcon: const Icon(
            Icons.calendar_month,
            color: AppColors.textSecondary,
          ),
          label: l10n.myDay,
        ),
      ],
    );
  }
}