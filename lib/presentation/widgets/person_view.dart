import 'package:flutter/material.dart';
import '../../domain/entities/performance.dart';
import '../../domain/entities/priority.dart';
import '../../domain/entities/team_member.dart';
import 'member_selector.dart';
import 'operations_standard_card.dart';
import 'performace_card.dart';
import 'strategic_priorities_section.dart';
import 'time_period_selector.dart';

class PersonView extends StatefulWidget {
  final Performance performance;
  final List<TeamMember> team;

  const PersonView({
    super.key,
    required this.performance,
    required this.team,
  });

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> {
  String selectedPeriod = 'Month';
  String? selectedMember;

  late List<Priority> selectedPriorities;

  @override
  void initState() {
    super.initState();

    if (widget.team.isNotEmpty) {
      selectedMember = widget.team.first.name;
    }

    selectedPriorities = _defaultPriorities();
  }

  List<Priority> _defaultPriorities() {
    return const [
      Priority(
        id: '1',
        category: 'Mastering Collaboration',
        title: 'Leverage references & peers',
        description: 'Use proof and peers to close.',
      ),
      Priority(
        id: '2',
        category: 'Mastering Sales',
        title: 'Win back dormant accounts',
        description: 'Reactivate accounts before they churn.',
      ),
      Priority(
        id: '3',
        category: 'Mastering Collaboration',
        title: 'Improve cross-team handovers',
        description: 'Fast, complete handovers to every team.',
      ),
    ];
  }

  Future<void> _openAddPriorities() async {
    final result = await Navigator.pushNamed(
      context,
      '/add-priority',
    );

    if (!mounted) {
      return;
    }

    if (result is List<Priority>) {
      setState(() {
        selectedPriorities = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        120,
      ),
      children: [
        MemberSelector(
          members: widget.team,
          selectedMember: selectedMember,
          onChanged: (value) {
            setState(() {
              selectedMember = value;
            });
          },
        ),

        const SizedBox(height: 36),

        const _SectionHeader(
          title: 'AM Performance',
        ),

        const SizedBox(height: 18),

        PerformanceCard(
          performance: widget.performance,
        ),

        const SizedBox(height: 24),

        TimePeriodSelector(
          selectedPeriod: selectedPeriod,
          onChanged: (value) {
            setState(() {
              selectedPeriod = value;
            });
          },
        ),

        const SizedBox(height: 26),

        OperationsStandardCard(
          performance: widget.performance,
        ),

        const SizedBox(height: 28),

        StrategicPrioritiesSection(
          memberName: selectedMember ?? '',
          priorities: selectedPriorities,
          onEdit: _openAddPriorities,
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