
import 'package:flutter/material.dart';

import '../../../core/theme/app_dimensions.dart';
import '../../../domain/entities/team_member.dart';
import 'team_member_card.dart';

class TeamMemberGrid extends StatelessWidget {
  final List<TeamMember> team;
  final ValueChanged<TeamMember> onMemberTap;

  const TeamMemberGrid({
    super.key,
    required this.team,
    required this.onMemberTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: team.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimensions.spacing10,
        mainAxisSpacing: AppDimensions.spacing10,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, index) {
        final member = team[index];

        return TeamMemberCard(
          member: member,
          onTap: () {
            onMemberTap(member);
          },
        );
      },
    );
  }
}
