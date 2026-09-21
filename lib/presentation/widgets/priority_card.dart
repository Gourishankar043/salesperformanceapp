import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';
import '../../domain/entities/priority.dart';

class PriorityCard extends StatelessWidget {
  final Priority priority;

  const PriorityCard({
    super.key,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          priority.title,
          style: AppTextStyles.heading,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            priority.description,
            style: AppTextStyles.body,
          ),
        ),
      ),
    );
  }
}