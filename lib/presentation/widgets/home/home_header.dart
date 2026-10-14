import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/widgets/view_toggle.dart';

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
        AppDimensions.homeHeaderHorizontalPadding,
        AppDimensions.homeHeaderTopPadding,
        AppDimensions.homeHeaderHorizontalPadding,
        AppDimensions.homeHeaderBottomPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      height: AppDimensions.homeHeaderControlHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeHeaderControlPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(
          AppDimensions.homeHeaderControlRadius,
        ),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: AppDimensions.homeHeaderIconSize,
              color: AppColors.mutedDark,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.support_agent,
              size: AppDimensions.homeHeaderIconSize,
              color: AppColors.mutedDark,
            ),
          ),
        ],
      ),
    );
  }
}