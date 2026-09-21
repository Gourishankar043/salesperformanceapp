import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../domain/entities/team_member.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;

  const TeamMemberCard({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary,
          child: Text(
            member.name[0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          member.name,
          style: AppTextStyles.heading,
        ),
        subtitle: Text(
          member.role,
          style: AppTextStyles.caption,
        ),
        trailing: Text(
          '${member.performance.toStringAsFixed(0)}%',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.success,
          ),
        ),
      ),
    );
  }
}