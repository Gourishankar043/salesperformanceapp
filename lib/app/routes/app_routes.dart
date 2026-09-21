import 'package:flutter/material.dart';
import '../../presentation/screens/add_priority_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/team_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RouteNames.team:
        return MaterialPageRoute(
          builder: (_) => const TeamScreen(),
        );
      case RouteNames.addPriority:
        return MaterialPageRoute(
          builder: (_) => const AddPriorityScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}