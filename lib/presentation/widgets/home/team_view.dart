
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_section_header.dart';
import '../../../core/widgets/time_period_selector.dart';
import '../../../domain/entities/team_member.dart';
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
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.spacing16,
        AppDimensions.spacing12,
        AppDimensions.spacing16,
        AppDimensions.spacing110,
      ),
      children: [
        Text(
          'My team',
          style: AppTextStyles.title.copyWith(
            fontSize: AppDimensions.fontSize36,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacing36),
        const AppSectionHeader(
          title: 'Team Overview',
        ),
        const SizedBox(height: AppDimensions.spacing16),
        const TeamOverviewCard(),
        const SizedBox(height: AppDimensions.spacing62),
        const AppSectionHeader(
          title: 'AM Overview',
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
        const _OverviewLegend(),
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
  const _OverviewLegend();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '%',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: AppDimensions.fontSize14,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: AppDimensions.spacing7),
        Text(
          'Plan YTD',
          style: AppTextStyles.caption.copyWith(
            fontSize: AppDimensions.fontSize13,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: AppDimensions.spacing18),
        const Icon(
          Icons.calendar_month_outlined,
          size: AppDimensions.iconSmall,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: AppDimensions.spacing6),
        Flexible(
          child: Text(
            'Executed Events / day',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption.copyWith(
              fontSize: AppDimensions.fontSize13,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.spacing12),
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
  }
}
