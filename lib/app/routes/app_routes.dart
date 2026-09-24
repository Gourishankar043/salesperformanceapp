import 'package:flutter/material.dart';
import '../../presentation/screens/add_priority_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/team_screen.dart';
import 'route_names.dart';
import '../../presentation/screens/chatbot_screen.dart';
import '../../presentation/screens/my_day_screen.dart';

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
      case RouteNames.chatbot:
        return MaterialPageRoute(
          builder: (_) => const ChatbotScreen(),
        );

      case RouteNames.myDay:
        return MaterialPageRoute(
          builder: (_) => const MyDayScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}