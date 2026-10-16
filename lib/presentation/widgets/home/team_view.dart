import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_section_header.dart';
import '../../../core/widgets/time_period_selector.dart';
import '../../../domain/entities/team_member.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../performance/team_overview.dart';
import '../team/team_member_grid.dart';

class TeamView extends StatefulWidget {
  final List<TeamMember> team;
  final ValueChanged<TeamMember> onMemberTap;

  const TeamView({
    super.key,
    required this.team,
    required this.onMemberTap,
  });

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  String selectedPeriod = 'Month';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.spacing16,
        AppDimensions.spacing12,
        AppDimensions.spacing16,
        AppDimensions.spacing110,
      ),
      children: [
        Text(
          l10n.myTeam,
          style: AppTextStyles.title.copyWith(
            fontSize: AppDimensions.fontSize36,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacing36),
        AppSectionHeader(
          title: l10n.teamOverview,
        ),
        const SizedBox(height: AppDimensions.spacing16),
        const TeamOverviewCard(),
        const SizedBox(height: AppDimensions.spacing62),
        AppSectionHeader(
          title: l10n.amOverview,
        ),
        const SizedBox(height: AppDimensions.spacing16),
        TimePeriodSelector(
          selectedPeriod: selectedPeriod,
          onChanged: (period) {
            setState(() {
              selectedPeriod = period;
            });
          },
        ),
        const SizedBox(height: AppDimensions.spacing18),
        _OverviewLegend(
          planYtdLabel: l10n.planYtd,
          executedEventsLabel: l10n.executedEventsPerDay,
        ),
        const SizedBox(height: AppDimensions.spacing18),
        TeamMemberGrid(
          team: widget.team,
          onMemberTap: widget.onMemberTap,
        ),
      ],
    );
  }
}

class _OverviewLegend extends StatelessWidget {
  final String planYtdLabel;
  final String executedEventsLabel;

  const _OverviewLegend({
    required this.planYtdLabel,
    required this.executedEventsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxItemWidth = constraints.maxWidth;

        return Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: AppDimensions.spacing12,
          runSpacing: AppDimensions.spacing10,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '%',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: AppDimensions.fontSize14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(
                  width: AppDimensions.spacing7,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: maxItemWidth * 0.65,
                  ),
                  child: Text(
                    planYtdLabel,
                    softWrap: true,
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppDimensions.fontSize13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  size: AppDimensions.iconSmall,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(
                  width: AppDimensions.spacing6,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: maxItemWidth * 0.65,
                  ),
                  child: Text(
                    executedEventsLabel,
                    softWrap: true,
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppDimensions.fontSize13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing9,
                vertical: AppDimensions.spacing5,
              ),
              decoration: BoxDecoration(
                color: AppColors.chipBackground,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusSmall,
                ),
              ),
              child: Text(
                'MTD',
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppDimensions.fontSize12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mutedDark,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}