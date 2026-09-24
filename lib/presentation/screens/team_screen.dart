import 'package:flutter/material.dart';

import '../../app/di/injection.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../domain/usecases/get_team.dart';
import '../widgets/team_member_card.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Team'),
      ),

      body: FutureBuilder(
        future: getIt<GetTeam>()(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 42,
                      color: AppColors.error,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Unable to load team',
                      style: AppTextStyles.heading,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ),
            );
          }

          final members = snapshot.data ?? [];

          if (members.isEmpty) {
            return const Center(
              child: Text(
                'No team members found',
                style: AppTextStyles.body,
              ),
            );
          }

          final averagePerformance = members.fold<double>(
            0,
                (sum, member) => sum + member.performance,
          ) /
              members.length;

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(members.length),

                const SizedBox(height: 16),

                _buildTeamSummary(
                  members.length,
                  averagePerformance,
                ),

                const SizedBox(height: 24),

                const Text(
                  'Team Members',
                  style: AppTextStyles.sectionTitle,
                ),

                const SizedBox(height: 12),

                ...members.map(
                      (member) => TeamMemberCard(
                    member: member,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(int memberCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Team',
          style: AppTextStyles.sectionTitle,
        ),

        const SizedBox(height: 5),

        Text(
          '$memberCount team members',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  Widget _buildTeamSummary(
      int memberCount,
      double averagePerformance,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SummaryItem(
              label: 'Team Members',
              value: '$memberCount',
              icon: Icons.groups_outlined,
              light: true,
            ),
          ),

          Container(
            width: 1,
            height: 48,
            color: Colors.white24,
          ),

          Expanded(
            child: _SummaryItem(
              label: 'Avg. Performance',
              value:
              '${averagePerformance.toStringAsFixed(0)}%',
              icon: Icons.trending_up,
              light: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool light;

  const _SummaryItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.light,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Icon(
            icon,
            size: 22,
            color: light
                ? Colors.white70
                : AppColors.primary,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: light
                  ? Colors.white
                  : AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: light
                  ? Colors.white70
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}