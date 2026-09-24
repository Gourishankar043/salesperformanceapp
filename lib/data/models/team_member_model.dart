import '../../domain/entities/team_member.dart';
import 'performance_model.dart';

class TeamMemberModel extends TeamMember {
  const TeamMemberModel({
    required super.id,
    required super.name,
    required super.role,
    required super.performance,
    required super.details,
  });

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      performance: (json['performance'] as num).toDouble(),
      details: PerformanceModel.fromJson(
        json['details'] as Map<String, dynamic>,
      ),
    );
  }
}