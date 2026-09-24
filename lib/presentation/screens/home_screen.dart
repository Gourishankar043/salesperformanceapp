import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/di/injection.dart';
import '../bloc/dashboard/dashboard_bloc.dart';
import '../bloc/dashboard/dashboard_event.dart';
import '../bloc/dashboard/dashboard_state.dart';
import '../widgets/app_bottom_navigation.dart';
import '../widgets/home_header.dart';
import '../widgets/person_view.dart';
import '../widgets/team_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTeamView = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardBloc>()
        ..add(
          LoadDashboard(),
        ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HomeHeader(
                isTeamView: isTeamView,
                onTeamSelected: () {
                  setState(() {
                    isTeamView = true;
                  });
                },
                onPersonSelected: () {
                  setState(() {
                    isTeamView = false;
                  });
                },
              ),

              Expanded(
                child: BlocBuilder<
                    DashboardBloc,
                    DashboardState>(
                  builder: (context, state) {
                    if (state is DashboardLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is DashboardError) {
                      return Center(
                        child: Text(
                          state.message,
                        ),
                      );
                    }

                    if (state is DashboardLoaded) {
                      if (isTeamView) {
                        return TeamView(
                          team: state.team,
                        );
                      }

                      return PersonView(
                        performance: state.performance,
                        team: state.team,
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
        const AppBottomNavigation(),
      ),
    );
  }
}