
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
    return DropdownButtonFormField<String>(
      initialValue: members.any(
            (member) => member.name == selectedMember,
      )
          ? selectedMember
          : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.card,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing20,
          vertical: AppDimensions.spacing17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusLarge,
          ),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusLarge,
          ),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: AppDimensions.iconLarge,
        color: AppColors.textSecondary,
      ),
      items: members.map((member) {
        return DropdownMenuItem<String>(
          value: member.name,
          child: Text(
            member.name,
            style: AppTextStyles.body.copyWith(
              fontSize: AppDimensions.fontSize18,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
