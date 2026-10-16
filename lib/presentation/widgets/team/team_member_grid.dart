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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final int crossAxisCount;
        if (width < 340) {
          crossAxisCount = 1;
        } else if (width < 700) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = (width / 260).floor().clamp(2, 4);
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: team.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppDimensions.spacing10,
            mainAxisSpacing: AppDimensions.spacing10,
            childAspectRatio:
            AppDimensions.teamMemberGridChildAspectRatio,
          ),
          itemBuilder: (context, index) {
            final member = team[index];

            return TeamMemberCard(
              member: member,
              onTap: () => onMemberTap(member),
            );
          },
        );
      },
    );
  }
}