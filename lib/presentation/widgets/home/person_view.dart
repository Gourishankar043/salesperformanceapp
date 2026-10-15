import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_section_header.dart';
import '../../../core/widgets/time_period_selector.dart';
import '../../../domain/entities/performance.dart';
import '../../../domain/entities/priority.dart';
import '../../../domain/entities/team_member.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../performance/operations_standard_card.dart';
import '../performance/performace_card.dart';
import '../priority/strategic_priorities_section.dart';
import 'member_selector.dart';

class PersonView extends StatefulWidget {
  final Performance performance;
  final List<TeamMember> team;
  final TeamMember? initialMember;

  const PersonView({
    super.key,
    required this.performance,
    required this.team,
    this.initialMember,
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

    if (widget.initialMember != null) {
      selectedMember = widget.initialMember!.name;
    } else if (widget.team.isNotEmpty) {
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

  List<Priority> _localizedPriorities(AppLocalizations l10n) {
    return selectedPriorities.map((priority) {
      switch (priority.id) {
        case '1':
          return Priority(
            id: priority.id,
            category: l10n.masteringCollaboration,
            title: l10n.leverageReferencesPeers,
            description: l10n.useProofAndPeers,
          );
        case '2':
          return Priority(
            id: priority.id,
            category: l10n.masteringSales,
            title: l10n.winBackDormantAccounts,
            description: l10n.reactivateAccounts,
          );
        case '3':
          return Priority(
            id: priority.id,
            category: l10n.masteringCollaboration,
            title: l10n.improveCrossTeamHandovers,
            description: l10n.fastCompleteHandovers,
          );
        default:
        // Keep custom priorities unchanged.
          return priority;
      }
    }).toList();
  }

  Future<void> _openAddPriorities() async {
    final result = await Navigator.pushNamed(context, '/add-priority');

    if (!mounted) return;

    if (result is List<Priority>) {
      setState(() {
        selectedPriorities = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (widget.team.isEmpty) {
      return Center(
        child: Text(
          l10n.noTeamMembers,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    TeamMember selectedTeamMember = widget.team.first;

    for (final member in widget.team) {
      if (member.name == selectedMember) {
        selectedTeamMember = member;
        break;
      }
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.spacing16,
        AppDimensions.spacing12,
        AppDimensions.spacing16,
        AppDimensions.spacing120,
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
        const SizedBox(height: AppDimensions.spacing36),
        AppSectionHeader(title: l10n.amPerformance),
        const SizedBox(height: AppDimensions.spacing18),
        PerformanceCard(
          performance: selectedTeamMember.details,
        ),
        const SizedBox(height: AppDimensions.spacing24),
        TimePeriodSelector(
          selectedPeriod: selectedPeriod,
          onChanged: (value) {
            setState(() {
              selectedPeriod = value;
            });
          },
        ),
        const SizedBox(height: AppDimensions.spacing26),
        OperationsStandardCard(
          performance: selectedTeamMember.details,
        ),
        const SizedBox(height: AppDimensions.spacing28),
        StrategicPrioritiesSection(
          memberName: selectedMember ?? '',
          priorities: _localizedPriorities(l10n),
          onEdit: _openAddPriorities,
        ),
      ],
    );
  }
}