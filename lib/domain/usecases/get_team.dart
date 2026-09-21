import '../entities/team_member.dart';
import '../repositories/app_repositories.dart';

class GetTeam {
  final AppRepository repository;

  GetTeam(this.repository);

  Future<List<TeamMember>> call() {
    return repository.getTeam();
  }
}