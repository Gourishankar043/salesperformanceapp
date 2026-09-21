abstract class PriorityEvent {}

class LoadPriorities extends PriorityEvent {}

class SavePrioritySelection extends PriorityEvent {
  final List<String> priorityIds;

  SavePrioritySelection(this.priorityIds);
}