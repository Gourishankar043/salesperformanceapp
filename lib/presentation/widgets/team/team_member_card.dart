
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/team_member.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;
  final VoidCallback onTap;

  const TeamMemberCard({
    super.key,
    required this.member,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final positive = member.performance >= 100;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
          AppDimensions.spacing18,
        ),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusLarge,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              member.name,
              style: AppTextStyles.heading.copyWith(
                fontSize: AppDimensions.fontSize17,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing8,
                    vertical: AppDimensions.spacing5,
                  ),
                  decoration: BoxDecoration(
                    color: positive
                        ? AppColors.successSoft
                        : AppColors.accentRedSoft,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusSmall,
                    ),
                  ),
                  child: Text(
                    '${member.performance.toStringAsFixed(0)}%',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: AppDimensions.fontSize18,
                      fontWeight: FontWeight.w700,
                      color: positive
                          ? AppColors.successDark
                          : AppColors.accentRedDark,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: AppDimensions.iconMedium,
                      color: AppColors.mutedBorder,
                    ),
                    const SizedBox(
                      width: AppDimensions.spacing8,
                    ),
                    Text(
                      '—',
                      style: AppTextStyles.heading.copyWith(
                        fontSize: AppDimensions.fontSize23,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
