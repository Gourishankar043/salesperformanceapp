import 'package:flutter/material.dart';

import '../../domain/entities/team_member.dart';

class MemberSelector extends StatelessWidget {
  final List<TeamMember> members;
  final String? selectedMember;
  final ValueChanged<String?> onChanged;

  const MemberSelector({
    super.key,
    required this.members,
    required this.selectedMember,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedMember,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: Color(0xFFC9C6C0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: Color(0xFFC9C6C0),
          ),
        ),
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 28,
      ),
      items: members.map((member) {
        return DropdownMenuItem<String>(
          value: member.name,
          child: Text(
            member.name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}