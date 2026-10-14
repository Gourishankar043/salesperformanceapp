import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

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
      height: AppDimensions.spacing62,
      padding: const EdgeInsets.all(
        AppDimensions.spacing4,
      ),
      decoration: BoxDecoration(
        color: AppColors.chipBackground,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusPill,
        ),
      ),
      child: Row(
        children: [
          ViewToggleButton(
            icon: Icons.groups,
            selected: isTeamView,
            onTap: onTeamSelected,
          ),
          ViewToggleButton(
            icon: Icons.person,
            selected: !isTeamView,
            onTap: onPersonSelected,
          ),
        ],
      ),
    );
  }
}

class ViewToggleButton extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const ViewToggleButton({
    super.key,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.spacing62,
        height: AppDimensions.spacing54,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accentRed
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: AppDimensions.size25,
          color: selected
              ? AppColors.white
              : AppColors.mutedDark,
        ),
      ),
    );
  }
}