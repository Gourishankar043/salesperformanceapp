import 'package:flutter/material.dart';

import '../../domain/entities/priority.dart';

class PriorityCard extends StatelessWidget {
  final Priority priority;
  final bool isSelected;
  final VoidCallback onTap;

  const PriorityCard({
    super.key,
    required this.priority,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFFF1F3)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFE0001B)
                : const Color(0xFFE5E5E5),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CategoryChip(
                    category: priority.category,
                    isSelected: isSelected,
                  ),
                  const SizedBox(height: 10),

                  Text(
                    priority.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? const Color(0xFFE0001B)
                          : const Color(0xFF202020),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    priority.description,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      color: isSelected
                          ? const Color(0xFFE0001B)
                          : const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFE0001B)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFE0001B)
                      : const Color(0xFFBDBDBD),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(
                Icons.check,
                size: 17,
                color: Colors.white,
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String category;
  final bool isSelected;

  const _CategoryChip({
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFFFDDE2)
            : const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: isSelected
              ? const Color(0xFFE0001B)
              : const Color(0xFF555555),
        ),
      ),
    );
  }
}