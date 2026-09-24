import 'package:flutter/material.dart';

import 'view_toggle.dart';

class HomeHeader extends StatelessWidget {
  final bool isTeamView;
  final VoidCallback onTeamSelected;
  final VoidCallback onPersonSelected;

  const HomeHeader({
    super.key,
    required this.isTeamView,
    required this.onTeamSelected,
    required this.onPersonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        30,
        12,
        30,
        16,
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          _buildLeftControls(),
          ViewToggle(
            isTeamView: isTeamView,
            onTeamSelected: onTeamSelected,
            onPersonSelected: onPersonSelected,
          ),
        ],
      ),
    );
  }

  Widget _buildLeftControls() {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFE4DED4),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Color(0xFF555555),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.support_agent,
              size: 30,
              color: Color(0xFF555555),
            ),
          ),
        ],
      ),
    );
  }
}