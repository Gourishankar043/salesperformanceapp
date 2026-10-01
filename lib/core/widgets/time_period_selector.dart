import 'package:flutter/material.dart';

class TimePeriodSelector extends StatelessWidget {
  final String selectedPeriod;
  final ValueChanged<String> onChanged;

  const TimePeriodSelector({
    super.key,
    required this.selectedPeriod,
    required this.onChanged,
  });

  static const List<String> periods = [
    'Bi-weekly',
    'Month',
    'Quarter',
    'Year',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: periods.map((period) {
          final bool isSelected = selectedPeriod == period;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                onChanged(period);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFFFFFFF)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: isSelected
                      ? const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ]
                      : null,
                ),
                child: Text(
                  period,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                    isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? const Color(0xFF202124)
                        : const Color(0xFF777777),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}