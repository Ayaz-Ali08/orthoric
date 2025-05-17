import 'package:orthorec/patient/Patient_Model/PatientDashBard_model.dart';

class PatientController {
  PatientDashbordModel getPatientDetails() {
    return PatientDashbordModel.demo();
  }

  Future<void> cancelAppointment(String patientId) async {
    // Implement cancellation logic
    print('Appointment cancelled for patient $patientId');
  }

  Future<void> updateTreatmentDetails(String patientId, String details) async {
    // Implement update logic
    print('Treatment updated for patient $patientId: $details');
  }
}