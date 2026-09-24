import '../../../domain/entities/priority.dart';

abstract class PriorityState {}

class PriorityInitial extends PriorityState {}

class PriorityLoading extends PriorityState {}

class PriorityLoaded extends PriorityState {
  final List<Priority> priorities;

  PriorityLoaded(this.priorities);
}

class PrioritySaved extends PriorityState {
  final List<Priority> priorities;

  PrioritySaved(this.priorities);
}

class PriorityError extends PriorityState {
  final String message;

  PriorityError(this.message);
}