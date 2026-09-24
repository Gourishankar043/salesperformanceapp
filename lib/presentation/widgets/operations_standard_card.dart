import 'package:flutter/material.dart';

import '../../domain/entities/performance.dart';

class OperationsStandardCard extends StatelessWidget {
  final Performance performance;

  const OperationsStandardCard({
    super.key,
    required this.performance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Op. Standards',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202124),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDDE2),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  '${performance.demoDaysPercentage.toStringAsFixed(0)}% Demo days',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFE0001B),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                performance.eventsExecuted.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF111111),
                ),
              ),

              const SizedBox(width: 7),

              const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text(
                  'Events Executed',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF777777),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          _PerformanceBar(
            eventsWithFc: performance.eventsWithFc,
            eventsExecuted: performance.eventsExecuted,
            eventsPlanned: performance.eventsPlanned,
          ),

          const SizedBox(height: 12),

          _Legend(
            eventsWithFc: performance.eventsWithFc,
            eventsExecuted: performance.eventsExecuted,
            eventsPlanned: performance.eventsPlanned,
          ),

          const SizedBox(height: 24),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                performance.acceptedLeads.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111111),
                ),
              ),

              const SizedBox(width: 8),

              const Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'Accepted Leads',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF777777),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PerformanceBar extends StatelessWidget {
  final double eventsWithFc;
  final double eventsExecuted;
  final double eventsPlanned;

  const _PerformanceBar({
    required this.eventsWithFc,
    required this.eventsExecuted,
    required this.eventsPlanned,
  });

  @override
  Widget build(BuildContext context) {
    final double total = eventsPlanned <= 0 ? 1 : eventsPlanned;

    final double fcWidth =
    (eventsWithFc / total).clamp(0.0, 1.0);

    final double executedWidth =
    (eventsExecuted / total).clamp(0.0, 1.0);

    final double remainingWidth =
    (1 - executedWidth).clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        height: 13,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: (fcWidth * 100).round().clamp(1, 100),
              child: Container(
                color: const Color(0xFFE0001B),
              ),
            ),

            Expanded(
              flex: (executedWidth * 100).round().clamp(1, 100),
              child: Container(
                color: const Color(0xFFED9CAE),
              ),
            ),

            Expanded(
              flex: (remainingWidth * 100).round().clamp(1, 100),
              child: Container(
                color: const Color(0xFFD7CFBE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final double eventsWithFc;
  final double eventsExecuted;
  final double eventsPlanned;

  const _Legend({
    required this.eventsWithFc,
    required this.eventsExecuted,
    required this.eventsPlanned,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 8,
      children: [
        _LegendItem(
          color: const Color(0xFFE0001B),
          text: 'w/ FC ${eventsWithFc.toStringAsFixed(1)}',
        ),
        _LegendItem(
          color: const Color(0xFFED9CAE),
          text: 'Executed ${eventsExecuted.toStringAsFixed(1)}',
        ),
        _LegendItem(
          color: const Color(0xFFD7CFBE),
          text: 'Planned ${eventsPlanned.toStringAsFixed(1)}',
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}