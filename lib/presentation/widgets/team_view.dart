import 'package:flutter/material.dart';
import 'package:salesperformanceapp/presentation/widgets/team_overview.dart';

import '../../domain/entities/team_member.dart';
import 'team_member_grid.dart';
import 'time_period_selector.dart';

class TeamView extends StatefulWidget {
  final List<TeamMember> team;

  const TeamView({
    super.key,
    required this.team,
  });

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  String selectedPeriod = 'Month';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 110),
      children: [
        const Text(
          'My team',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Color(0xFF202124),
          ),
        ),

        const SizedBox(height: 36),

        _SectionHeader(
          title: 'Team Overview',
        ),

        const SizedBox(height: 16),

        const TeamOverviewCard(),

        const SizedBox(height: 62),

        _SectionHeader(
          title: 'AM Overview',
        ),

        const SizedBox(height: 16),

        TimePeriodSelector(
          selectedPeriod: selectedPeriod,
          onChanged: (period) {
            setState(() {
              selectedPeriod = period;
            });
          },
        ),

        const SizedBox(height: 18),

        const _OverviewLegend(),

        const SizedBox(height: 18),

        TeamMemberGrid(
          team: widget.team,
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF202124),
            ),
          ),
        ),

        const SizedBox(width: 8),

        const Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sync,
                size: 15,
                color: Color(0xFF777777),
              ),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  'Last updated: 2026-09-09',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF777777),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OverviewLegend extends StatelessWidget {
  const _OverviewLegend();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '%',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF666666),
          ),
        ),

        const SizedBox(width: 7),

        const Text(
          'Plan YTD',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF666666),
          ),
        ),

        const SizedBox(width: 18),

        const Icon(
          Icons.calendar_month_outlined,
          size: 15,
          color: Color(0xFF666666),
        ),

        const SizedBox(width: 6),

        const Flexible(
          child: Text(
            'Executed Events / day',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF666666),
            ),
          ),
        ),

        const SizedBox(width: 12),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Text(
            'MTD',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}