import 'package:flutter/material.dart';

class TimePeriodSelector extends StatelessWidget {
  final String selectedPeriod;
  final ValueChanged<String> onChanged;

  const TimePeriodSelector({
    super.key,
    required this.selectedPeriod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const periods = ['Weekly', 'Monthly', 'Quarterly'];

    return SegmentedButton<String>(
      segments: periods
          .map(
            (period) => ButtonSegment<String>(
          value: period,
          label: Text(period),
        ),
      )
          .toList(),
      selected: {selectedPeriod},
      onSelectionChanged: (selection) {
        onChanged(selection.first);
      },
    );
  }
}