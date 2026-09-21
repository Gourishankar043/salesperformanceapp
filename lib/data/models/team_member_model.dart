import '../../domain/entities/team_member.dart';

class TeamMemberModel extends TeamMember {
  const TeamMemberModel({
    required super.id,
    required super.name,
    required super.role,
    required super.performance,
  });

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['id'].toString(),
      name: json['name'] as String,
      role: json['role'] as String,
      performance: (json['performance'] as num).toDouble(),
    );
  }
}