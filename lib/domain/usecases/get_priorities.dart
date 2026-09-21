import '../entities/priority.dart';
import '../repositories/app_repositories.dart';

class GetPriorities {
  final AppRepository repository;

  GetPriorities(this.repository);

  Future<List<Priority>> call() {
    return repository.getPriorities();
  }
}