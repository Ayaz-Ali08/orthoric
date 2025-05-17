class PendingAppointment {
  final String id;
  final String patientName;
  final String condition;

  PendingAppointment({
    required this.id,
    required this.patientName,
    required this.condition,
  });

  // Mock data generator
  static List<PendingAppointment> generateMockData() {
    return [
      PendingAppointment(id: '1', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      PendingAppointment(id: '2', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      PendingAppointment(id: '3', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      PendingAppointment(id: '3', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      PendingAppointment(id: '3', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      PendingAppointment(id: '3', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      PendingAppointment(id: '3', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      PendingAppointment(id: '3', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      PendingAppointment(id: '3', patientName: 'Arshad Ali', condition: 'Gingivitis'),
    ];
  }
}