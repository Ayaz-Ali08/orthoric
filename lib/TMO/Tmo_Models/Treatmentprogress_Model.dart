class TreatmentProgress_mod {
  final String id;
  final String patientName;
  final String condition;
  final DateTime lastUpdated;

  TreatmentProgress_mod({
    required this.id,
    required this.patientName,
    required this.condition,
    required this.lastUpdated,
  });

  // Mock data generator
  static List<TreatmentProgress_mod> generateMockData() {
    final now = DateTime.now();
    return [
      TreatmentProgress_mod(
        id: '1',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 2)),
      ),
      TreatmentProgress_mod(
        id: '2',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 5)),
      ),
      TreatmentProgress_mod(
        id: '3',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 7)),
      ),
      TreatmentProgress_mod(
        id: '3',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 7)),
      ),
      TreatmentProgress_mod(
        id: '3',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 7)),
      ),
      TreatmentProgress_mod(
        id: '3',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 7)),
      ),
      TreatmentProgress_mod(
        id: '3',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 7)),
      ),
      TreatmentProgress_mod(
        id: '3',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 7)),
      ),
      TreatmentProgress_mod(
        id: '3',
        patientName: 'Arshad Ali',
        condition: 'Gingivitis',
        lastUpdated: now.subtract(const Duration(days: 7)),
      ),
    ];
  }
}
