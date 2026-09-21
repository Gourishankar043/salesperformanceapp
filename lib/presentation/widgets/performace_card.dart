import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../domain/entities/performance.dart';

class PerformanceCard extends StatelessWidget {
  final Performance performance;

  const PerformanceCard({
    super.key,
    required this.performance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Performance', style: AppTextStyles.heading),
            const SizedBox(height: 16),
            _buildMetric(
              'Net Sales',
              '₹${performance.netSalesAchieved.toStringAsFixed(0)}',
              '${performance.netSalesPercentage.toStringAsFixed(0)}%',
            ),
            const SizedBox(height: 12),
            _buildMetric(
              'Events Executed',
              '${performance.eventsExecuted}',
              'of ${performance.eventsPlanned}',
            ),
            const SizedBox(height: 12),
            _buildMetric(
              'Events with FC',
              '${performance.eventsWithFc}',
              'events',
            ),
            const SizedBox(height: 12),
            _buildMetric(
              'Accepted Leads',
              '${performance.acceptedLeads}',
              'leads',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String title, String value, String trailing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.body),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 8),
            Text(trailing, style: AppTextStyles.caption),
          ],
        ),
      ],
    );
  }
}