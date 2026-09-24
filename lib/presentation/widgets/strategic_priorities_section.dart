import 'package:flutter/material.dart';
import '../../domain/entities/priority.dart';
import 'priority_card.dart';

class StrategicPrioritiesSection extends StatelessWidget {
  final String memberName;
  final List<Priority> priorities;
  final VoidCallback onEdit;

  const StrategicPrioritiesSection({
    super.key,
    required this.memberName,
    required this.priorities,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                'Strategic Priorities',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF202124),
                ),
              ),
            ),
            GestureDetector(
              onTap: onEdit,
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFD8D8D8),
                  ),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 22,
                  color: Color(0xFF202124),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text(
          '$memberName\'s focus for the next 3–6 months.',
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF777777),
          ),
        ),

        const SizedBox(height: 18),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            14,
            20,
            14,
            16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Priorities",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF202124),
                ),
              ),

              const SizedBox(height: 18),

              if (priorities.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'No priorities selected',
                      style: TextStyle(
                        color: Color(0xFF888888),
                      ),
                    ),
                  ),
                )
              else
                ...List.generate(
                  priorities.length,
                      (index) {
                    final priority = priorities[index];

                    return Column(
                      children: [
                        PriorityCard(
                          priority: priority,
                          isSelected: true,
                          onTap: () {},
                        ),

                        if (index != priorities.length - 1)
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            child: Divider(
                              height: 1,
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Priorities History',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF202124),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '3 Open     0 Completed',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF777777),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFD8D8D8),
                  ),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF777777),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}