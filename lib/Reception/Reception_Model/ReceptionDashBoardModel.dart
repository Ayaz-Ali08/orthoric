class ReceptionDashBordModels {
  final String id;
  final String patientName;
  final DateTime entryTime;
  final String purpose;
  final bool isNew;

  ReceptionDashBordModels({
    required this.id,
    required this.patientName,
    required this.entryTime,
    required this.purpose,
    this.isNew = false,
  });
}