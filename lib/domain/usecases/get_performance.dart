import '../entities/performance.dart';
import '../repositories/app_repositories.dart';

class GetPerformance {
  final AppRepository repository;

  GetPerformance(this.repository);

  Future<Performance> call() {
    return repository.getPerformance();
  }
}