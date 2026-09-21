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
  });

  factory PerformanceModel.fromJson(Map<String, dynamic> json) {
    return PerformanceModel(
      netSalesAchieved: (json['netSalesAchieved'] as num).toDouble(),
      netSalesPlan: (json['netSalesPlan'] as num).toDouble(),
      netSalesPercentage: (json['netSalesPercentage'] as num).toDouble(),
      eventsExecuted: json['eventsExecuted'] as int,
      eventsWithFc: json['eventsWithFc'] as int,
      eventsPlanned: json['eventsPlanned'] as int,
      acceptedLeads: json['acceptedLeads'] as int,
    );
  }
}