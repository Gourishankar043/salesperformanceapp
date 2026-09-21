import '../../../domain/entities/priority.dart';

abstract class PriorityState {}

class PriorityInitial extends PriorityState {}

class PriorityLoading extends PriorityState {}

class PriorityLoaded extends PriorityState {
  final List<Priority> priorities;

  PriorityLoaded(this.priorities);
}

class PrioritySaved extends PriorityState {}

class PriorityError extends PriorityState {
  final String message;

  PriorityError(this.message);
}