import '../entities/priority.dart';
import '../repositories/app_repositories.dart';

class SavePriorities {
  final AppRepository repository;

  SavePriorities(this.repository);

  Future<void> call(List<Priority> priorities) {
    return repository.savePriorities(priorities);
  }
}