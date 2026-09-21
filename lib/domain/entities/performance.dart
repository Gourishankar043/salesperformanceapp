class Performance {
  final double netSalesAchieved;
  final double netSalesPlan;
  final double netSalesPercentage;
  final int eventsExecuted;
  final int eventsWithFc;
  final int eventsPlanned;
  final int acceptedLeads;

  const Performance({
    required this.netSalesAchieved,
    required this.netSalesPlan,
    required this.netSalesPercentage,
    required this.eventsExecuted,
    required this.eventsWithFc,
    required this.eventsPlanned,
    required this.acceptedLeads,
  });
}