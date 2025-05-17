import 'package:orthorec/TMO/Tmo_Models/Treatmentprogress_Model.dart';

class TreatmentProgressController {
  List<TreatmentProgress_mod> _records = [];
  bool _isLoading = false;

  List<TreatmentProgress_mod> get records => _records;
  bool get isLoading => _isLoading;

  Future<void> loadRecords() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    _records = TreatmentProgress_mod.generateMockData();
    _isLoading = false;
  }

  Future<void> addRecord(String patientId) async {
    // In a real app, this would call your API
    await Future.delayed(const Duration(seconds: 1));
    print('New record added for patient $patientId');
  }
}