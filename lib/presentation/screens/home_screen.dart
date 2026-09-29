import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/di/injection.dart';
import '../../app/routes/route_names.dart';
import '../../domain/entities/team_member.dart';
import '../bloc/dashboard/dashboard_bloc.dart';
import '../bloc/dashboard/dashboard_event.dart';
import '../bloc/dashboard/dashboard_state.dart';
import '../widgets/app_bottom_navigation.dart';
import '../widgets/home_header.dart';
import '../widgets/person_view.dart';
import '../widgets/team_view.dart';

class HomeScreen extends StatefulWidget {
  final TeamMember? initialMember;

  const HomeScreen({
    super.key,
    this.initialMember,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTeamView = true;
  int selectedIndex = 0;

  TeamMember? selectedMember;

  @override
  void initState() {
    super.initState();

    selectedMember = widget.initialMember;

    if (widget.initialMember != null) {
      isTeamView = false;
    }
  }

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
                          onMemberTap: (member) {
                            setState(() {
                              selectedMember = member;
                              isTeamView = false;
                            });
                          },
                        );
                      }

                      return PersonView(
                        performance: state.performance,
                        team: state.team,
                        initialMember: selectedMember,
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: AppBottomNavigation(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            if (index == 0) {
              setState(() {
                selectedIndex = 0;
              });
            } else if (index == 1) {
              Navigator.pushNamed(
                context,
                RouteNames.chatbot,
              );
            } else if (index == 2) {
              Navigator.pushNamed(
                context,
                RouteNames.myDay,
              );
            }
          },
        ),
      ),
    );
  }
}