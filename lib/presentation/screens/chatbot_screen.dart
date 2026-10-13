import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            AppDimensions.spacing24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: AppDimensions.size72,
                height: AppDimensions.size72,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radius20,
                  ),
                ),
                child: const Icon(
                  Icons.chat_bubble_outline,
                  size: AppDimensions.size34,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(
                height: AppDimensions.spacing20,
              ),
              const Text(
                'Sales Assistant',
                style: AppTextStyles.sectionTitle,
              ),
              const SizedBox(
                height: AppDimensions.spacing8,
              ),
              Text(
                'Your sales assistant will be available here.',
                textAlign: TextAlign.center,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}