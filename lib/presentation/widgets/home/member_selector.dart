import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/team_member.dart';

class MemberSelector extends StatelessWidget {
  final List<TeamMember> members;
  final String? selectedMember;
  final ValueChanged<String?> onChanged;

  const MemberSelector({
    super.key,
    required this.members,
    required this.selectedMember,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final validSelectedMember = members.any(
              (member) => member.name == selectedMember,
        )
            ? selectedMember
            : null;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing12,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              AppDimensions.radiusMedium,
            ),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: validSelectedMember,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.textSecondary,
              ),
              hint: Text(
                'Select person',
                softWrap: true,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              items: members.map((member) {
                return DropdownMenuItem<String>(
                  value: member.name,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth > 0
                          ? constraints.maxWidth -
                          AppDimensions.spacing24
                          : double.infinity,
                    ),
                    child: Text(
                      member.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        );
      },
    );
  }
}