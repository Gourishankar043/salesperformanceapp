class Performance {
  final double netSalesAchieved;
  final double netSalesPlan;
  final double netSalesPercentage;

  final double eventsExecuted;
  final double eventsWithFc;
  final double eventsPlanned;
  final double acceptedLeads;
  final double demoDaysPercentage;

  const Performance({
    required this.netSalesAchieved,
    required this.netSalesPlan,
    required this.netSalesPercentage,
    required this.eventsExecuted,
    required this.eventsWithFc,
    required this.eventsPlanned,
    required this.acceptedLeads,
    required this.demoDaysPercentage,
  });
}