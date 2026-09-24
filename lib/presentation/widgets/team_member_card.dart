import 'package:flutter/material.dart';

import '../../domain/entities/team_member.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;

  const TeamMemberCard({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    final positive = member.performance >= 100;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            member.name,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: positive
                      ? const Color(0xFFE7F8EF)
                      : const Color(0xFFFFE8EB),
                  borderRadius:
                  BorderRadius.circular(7),
                ),
                child: Text(
                  '${member.performance.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: positive
                        ? const Color(0xFF087A38)
                        : const Color(0xFFA40016),
                  ),
                ),
              ),

              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 22,
                    color: Color(0xFFB8B7B2),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '—',
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}