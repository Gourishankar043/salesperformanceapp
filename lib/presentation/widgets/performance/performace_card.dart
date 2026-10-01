import 'package:flutter/material.dart';

import '../../../domain/entities/performance.dart';

class PerformanceCard extends StatelessWidget {
  final Performance performance;

  const PerformanceCard({
    super.key,
    required this.performance,
  });

  @override
  Widget build(BuildContext context) {
    final percentage =
        performance.netSalesPercentage / 100;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Net Sales',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'YTD',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF777777),
                    ),
                  ),
                ],
              ),
              _AchievementBadge(
                percentage:
                performance.netSalesPercentage,
              ),
            ],
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              _Value(
                value: _formatCurrency(
                  performance.netSalesAchieved,
                ),
                label: 'Achieved',
              ),
              _Value(
                value: _formatCurrency(
                  performance.netSalesPlan,
                ),
                label: 'Plan',
              ),
            ],
          ),

          const SizedBox(height: 22),

          _SalesProgress(
            value: percentage.clamp(0.0, 1.0),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double value) {
    if (value >= 1000000) {
      return '¥${(value / 1000000).toStringAsFixed(2)}M';
    }

    if (value >= 1000) {
      return '¥${(value / 1000).toStringAsFixed(0)}K';
    }

    return '¥${value.toStringAsFixed(0)}';
  }
}

class _AchievementBadge extends StatelessWidget {
  final double percentage;

  const _AchievementBadge({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F8ED),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        '${percentage.toStringAsFixed(0)}% of plan',
        style: const TextStyle(
          color: Color(0xFF087A38),
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _Value extends StatelessWidget {
  final String value;
  final String label;

  const _Value({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 17,
            color: Color(0xFF777777),
          ),
        ),
      ],
    );
  }
}

class _SalesProgress extends StatelessWidget {
  final double value;

  const _SalesProgress({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 12,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFECE9E4),
                ),
                FractionallySizedBox(
                  widthFactor: value,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: const Color(0xFF13B43D),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}