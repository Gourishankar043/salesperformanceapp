import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/performance_model.dart';
import '../models/priority_model.dart';
import '../models/team_member_model.dart';

abstract class AppLocalDataSource {
  Future<PerformanceModel> getPerformance();

  Future<List<PriorityModel>> getPriorities();

  Future<List<TeamMemberModel>> getTeam();

  Future<void> savePriorities(List<PriorityModel> priorities);
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  @override
  Future<PerformanceModel> getPerformance() async {
    final data = await rootBundle.loadString(
      'lib/data/json/performance.json',
    );

    final json = jsonDecode(data);

    return PerformanceModel.fromJson(json);
  }

  @override
  Future<List<PriorityModel>> getPriorities() async {
    final data = await rootBundle.loadString(
      'lib/data/json/priorities.json',
    );

    final json = jsonDecode(data) as List;

    return json
        .map(
          (item) => PriorityModel.fromJson(item),
    )
        .toList();
  }

  @override
  Future<List<TeamMemberModel>> getTeam() async {
    final data = await rootBundle.loadString(
      'lib/data/json/team.json',
    );

    final json = jsonDecode(data) as List;

    return json
        .map(
          (item) => TeamMemberModel.fromJson(item),
    )
        .toList();
  }

  @override
  Future<void> savePriorities(
      List<PriorityModel> priorities,
      ) async {
    // Mock implementation.
    // Selected priorities are handled in memory for now.
  }
}