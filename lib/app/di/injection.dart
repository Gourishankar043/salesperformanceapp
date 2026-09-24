import 'package:get_it/get_it.dart';
import '../../data/datasources/app_local_data_source.dart';
import '../../data/repositories/app_repository_impl.dart';
import '../../domain/repositories/app_repositories.dart';
import '../../domain/usecases/get_performance.dart';
import '../../domain/usecases/get_priorities.dart';
import '../../domain/usecases/get_team.dart';
import '../../domain/usecases/save_priorities.dart';
import '../../presentation/bloc/dashboard/dashboard_bloc.dart';
import '../../presentation/bloc/priority/priority_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<AppLocalDataSource>(
        () => AppLocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<AppRepository>(
        () => AppRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton(() => GetPerformance(getIt()));
  getIt.registerLazySingleton(() => GetPriorities(getIt()));
  getIt.registerLazySingleton(() => GetTeam(getIt()));
  getIt.registerLazySingleton(() => SavePriorities(getIt()));

  getIt.registerFactory(
        () => DashboardBloc(
      getPerformance: getIt(),
      getTeam: getIt(),
    ),
  );

  getIt.registerFactory(
        () => PriorityBloc(
      getPriorities: getIt(),
      savePriorities: getIt(),
    ),
  );
}