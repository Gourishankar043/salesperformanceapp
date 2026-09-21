import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_performance.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetPerformance getPerformance;

  DashboardBloc(this.getPerformance) : super(DashboardInitial()) {
    on<LoadDashboard>(_onLoadDashboard);
  }

  Future<void> _onLoadDashboard(
      LoadDashboard event,
      Emitter<DashboardState> emit,
      ) async {
    emit(DashboardLoading());

    try {
      final performance = await getPerformance();
      emit(DashboardLoaded(performance));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}