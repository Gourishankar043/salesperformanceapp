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
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isCompact = screenWidth < 400;

    return Container(
      height: AppDimensions.spacing62,
      padding: const EdgeInsets.all(AppDimensions.spacing4),
      decoration: BoxDecoration(
        color: AppColors.chipBackground,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusPill,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ViewToggleButton(
            icon: Icons.groups,
            selected: isTeamView,
            onTap: onTeamSelected,
            size: isCompact
                ? AppDimensions.spacing54
                : AppDimensions.spacing62,
          ),
          ViewToggleButton(
            icon: Icons.person,
            selected: !isTeamView,
            onTap: onPersonSelected,
            size: isCompact
                ? AppDimensions.spacing54
                : AppDimensions.spacing62,
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
  final double size;

  const ViewToggleButton({
    super.key,
    required this.icon,
    required this.selected,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: selected ? AppColors.accentRed : Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Icon(
            icon,
            size: AppDimensions.size25,
            color: selected ? AppColors.white : AppColors.mutedDark,
          ),
        ),
      ),
    );
  }
}