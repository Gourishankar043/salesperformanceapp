import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/performance.dart';
import '../../../domain/entities/team_member.dart';
import '../../../domain/usecases/get_performance.dart';
import '../../../domain/usecases/get_team.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc
    extends Bloc<DashboardEvent, DashboardState> {
  final GetPerformance getPerformance;
  final GetTeam getTeam;

  DashboardBloc({
    required this.getPerformance,
    required this.getTeam,
  }) : super(DashboardInitial()) {
    on<LoadDashboard>(_onLoadDashboard);
  }

  Future<void> _onLoadDashboard(
      LoadDashboard event,
      Emitter<DashboardState> emit,
      ) async {
    emit(DashboardLoading());

    try {
      final Performance performance =
      await getPerformance();

      final List<TeamMember> team =
      await getTeam();

      emit(
        DashboardLoaded(
          performance: performance,
          team: team,
        ),
      );
    } catch (e) {
      emit(
        DashboardError(
          e.toString(),
        ),
      );
    }
  }
}