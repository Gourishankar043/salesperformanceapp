import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_priorities.dart';
import '../../../domain/usecases/save_priorities.dart';
import 'priority_event.dart';
import 'priority_state.dart';

class PriorityBloc extends Bloc<PriorityEvent, PriorityState> {
  final GetPriorities getPriorities;
  final SavePriorities savePriorities;

  PriorityBloc({
    required this.getPriorities,
    required this.savePriorities,
  }) : super(PriorityInitial()) {
    on<LoadPriorities>(_onLoadPriorities);
    on<SavePrioritySelection>(_onSavePrioritySelection);
  }

  Future<void> _onLoadPriorities(
      LoadPriorities event,
      Emitter<PriorityState> emit,
      ) async {
    emit(PriorityLoading());

    try {
      final priorities = await getPriorities();

      emit(
        PriorityLoaded(priorities),
      );
    } catch (e) {
      emit(
        PriorityError(e.toString()),
      );
    }
  }

  Future<void> _onSavePrioritySelection(
      SavePrioritySelection event,
      Emitter<PriorityState> emit,
      ) async {
    try {
      final priorities = await getPriorities();

      final selected = priorities
          .where(
            (priority) => event.priorityIds.contains(priority.id),
      )
          .toList();

      await savePriorities(selected);

      emit(
        PrioritySaved(selected),
      );
    } catch (e) {
      emit(
        PriorityError(e.toString()),
      );
    }
  }
}