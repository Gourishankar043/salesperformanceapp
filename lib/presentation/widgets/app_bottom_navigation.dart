import 'package:flutter/material.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 82,
      backgroundColor: Colors.white,
      elevation: 8,
      selectedIndex: 0,
      onDestinationSelected: (_) {},
      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.home_outlined,
            color: Color(0xFF666666),
          ),
          selectedIcon: Icon(
            Icons.home,
            color: Color(0xFFB00016),
          ),
          label: 'ホーム',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.chat_bubble_outline,
            color: Color(0xFF666666),
          ),
          selectedIcon: Icon(
            Icons.chat_bubble,
            color: Color(0xFF666666),
          ),
          label: 'チャットボット',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.calendar_month_outlined,
            color: Color(0xFF666666),
          ),
          selectedIcon: Icon(
            Icons.calendar_month,
            color: Color(0xFF666666),
          ),
          label: 'マイデイ',
        ),
      ],
    );
  }
}