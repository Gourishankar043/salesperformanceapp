import '../entities/performance.dart';
import '../entities/priority.dart';
import '../entities/team_member.dart';

abstract class AppRepository {
  Future<Performance> getPerformance();
  Future<List<Priority>> getPriorities();
  Future<List<TeamMember>> getTeam();
  Future<void> savePriorities(List<Priority> priorities);
}