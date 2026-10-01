import 'package:flutter/material.dart';

class TeamOverviewCard extends StatelessWidget {
  const TeamOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        30,
        28,
        30,
        24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
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
              _StatusBadge(),
            ],
          ),

          const SizedBox(height: 34),

          const Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              _SalesValue(
                value: '¥5.28M',
                label: 'Achieved',
              ),
              _SalesValue(
                value: '¥4.41M',
                label: 'Plan',
              ),
            ],
          ),

          const SizedBox(height: 22),

          _ProgressBar(),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
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
      child: const Text(
        '120% Above plan',
        style: TextStyle(
          color: Color(0xFF087A38),
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _SalesValue extends StatelessWidget {
  final String value;
  final String label;

  const _SalesValue({
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
        const SizedBox(height: 3),
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

class _ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        height: 12,
        color: const Color(0xFFECE9E4),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 1,
          child: Container(
            color: const Color(0xFF13B43D),
          ),
        ),
      ),
    );
  }
}