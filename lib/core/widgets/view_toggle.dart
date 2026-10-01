import 'package:flutter/material.dart';

class ViewToggle extends StatelessWidget {
  final bool isTeamView;
  final VoidCallback onTeamSelected;
  final VoidCallback onPersonSelected;

  const ViewToggle({
    super.key,
    required this.isTeamView,
    required this.onTeamSelected,
    required this.onPersonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F0EF),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          _ToggleButton(
            icon: Icons.groups,
            selected: isTeamView,
            onTap: onTeamSelected,
          ),
          _ToggleButton(
            icon: Icons.person,
            selected: !isTeamView,
            onTap: onPersonSelected,
          ),
        ],
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ToggleButton({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62,
        height: 54,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFE0001B)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 25,
          color: selected
              ? Colors.white
              : const Color(0xFF555555),
        ),
      ),
    );
  }
}