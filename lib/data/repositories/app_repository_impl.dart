import '../../domain/entities/performance.dart';
import '../../domain/entities/priority.dart';
import '../../domain/entities/team_member.dart';
import '../../domain/repositories/app_repositories.dart';
import '../datasources/app_local_data_source.dart';

class AppRepositoryImpl implements AppRepository {
  final AppLocalDataSource localDataSource;

  AppRepositoryImpl(this.localDataSource);

  @override
  Future<Performance> getPerformance() {
    return localDataSource.getPerformance();
  }

  @override
  Future<List<Priority>> getPriorities() {
    return localDataSource.getPriorities();
  }

  @override
  Future<List<TeamMember>> getTeam() {
    return localDataSource.getTeam();
  }

  @override
  Future<void> savePriorities(List<Priority> priorities) {
    return localDataSource.savePriorities(
      priorities.cast(),
    );
  }
}