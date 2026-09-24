import 'performance.dart';

class TeamMember {
  final String id;
  final String name;
  final String role;
  final double performance;
  final Performance details;

  const TeamMember({
    required this.id,
    required this.name,
    required this.role,
    required this.performance,
    required this.details,
  });
}