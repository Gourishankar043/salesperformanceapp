import '../../domain/entities/performance.dart';

class PerformanceModel extends Performance {
  const PerformanceModel({
    required super.netSalesAchieved,
    required super.netSalesPlan,
    required super.netSalesPercentage,
    required super.eventsExecuted,
    required super.eventsWithFc,
    required super.eventsPlanned,
    required super.acceptedLeads,
    required super.demoDaysPercentage,
  });

  factory PerformanceModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PerformanceModel(
      netSalesAchieved:
      (json['netSalesAchieved'] as num).toDouble(),
      netSalesPlan:
      (json['netSalesPlan'] as num).toDouble(),
      netSalesPercentage:
      (json['netSalesPercentage'] as num).toDouble(),
      eventsExecuted:
      (json['eventsExecuted'] as num).toDouble(),
      eventsWithFc:
      (json['eventsWithFc'] as num).toDouble(),
      eventsPlanned:
      (json['eventsPlanned'] as num).toDouble(),
      acceptedLeads:
      (json['acceptedLeads'] as num).toDouble(),
      demoDaysPercentage:
      (json['demoDaysPercentage'] as num).toDouble(),
    );
  }
}