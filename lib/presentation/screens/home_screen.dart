import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesperformanceapp/presentation/widgets/performace_card.dart';
import '../../app/di/injection.dart';
import '../bloc/dashboard/dashboard_bloc.dart';
import '../bloc/dashboard/dashboard_event.dart';
import '../bloc/dashboard/dashboard_state.dart';
import '../widgets/time_period_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedPeriod = 'Monthly';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardBloc>()..add(LoadDashboard()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sales Performance'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TimePeriodSelector(
                selectedPeriod: selectedPeriod,
                onChanged: (period) {
                  setState(() {
                    selectedPeriod = period;
                  });
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    if (state is DashboardLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is DashboardLoaded) {
                      return SingleChildScrollView(
                        child: PerformanceCard(
                          performance: state.performance,
                        ),
                      );
                    }

                    if (state is DashboardError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}