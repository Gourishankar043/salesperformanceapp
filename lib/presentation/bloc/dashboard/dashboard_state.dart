import '../../../domain/entities/performance.dart';
import '../../../domain/entities/team_member.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final Performance performance;
  final List<TeamMember> team;

  DashboardLoaded({
    required this.performance,
    required this.team,
  });
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}