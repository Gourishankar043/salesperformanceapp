import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class MyDayScreen extends StatelessWidget {
  const MyDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Day'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today',
              style: AppTextStyles.sectionTitle,
            ),

            const SizedBox(height: 6),

            Text(
              'Your daily sales activities will appear here.',
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.border,
                ),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.today_outlined,
                    size: 40,
                    color: AppColors.primary,
                  ),

                  SizedBox(height: 12),

                  Text(
                    'No activities for today',
                    style: AppTextStyles.heading,
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Your planned activities will appear here.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}