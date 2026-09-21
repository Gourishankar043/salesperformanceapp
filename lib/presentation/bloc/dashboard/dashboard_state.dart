import '../../../domain/entities/performance.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final Performance performance;

  DashboardLoaded(this.performance);
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}