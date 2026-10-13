
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

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
    return NavigationBar(
      height: AppDimensions.navigationHeight,
      backgroundColor: AppColors.card,
      elevation: 8,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.home_outlined,
            color: AppColors.textSecondary,
          ),
          selectedIcon: Icon(
            Icons.home,
            color: AppColors.accentRed,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.chat_bubble_outline,
            color: AppColors.textSecondary,
          ),
          selectedIcon: Icon(
            Icons.chat_bubble,
            color: AppColors.textSecondary,
          ),
          label: 'Chatbot',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.calendar_month_outlined,
            color: AppColors.textSecondary,
          ),
          selectedIcon: Icon(
            Icons.calendar_month,
            color: AppColors.textSecondary,
          ),
          label: 'My Day',
        ),
      ],
    );
  }
}
