import 'package:orthorec/Reception/Reception_Model/ReceptionDashBoardModel.dart';
class ReceptionDashboradController {
  List<ReceptionDashBordModels> getTodaysEntries() {
    return [
      ReceptionDashBordModels(
        id: '1',
        patientName: 'Jan Alam',
        entryTime: DateTime.now().subtract(const Duration(hours: 2)),
        purpose: 'Follow-up',
      ),
      ReceptionDashBordModels(
        id: '2',
        patientName: 'New Patient',
        entryTime: DateTime.now(),
        purpose: 'Consultation',
        isNew: true,
      ),
    ];
  }

  Future<void> createNewEntry(Map<String, dynamic> data) async {
    // Implement API call to create new entry
    print('Creating new entry: $data');
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
  }
}