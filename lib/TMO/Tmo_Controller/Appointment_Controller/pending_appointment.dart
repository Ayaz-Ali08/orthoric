import 'package:orthorec/TMO/Tmo_Models/Appointment_Model/pending_appointment.dart';

class PendingAppointmentController {
  List<PendingAppointment> _appointments = [];
  bool _isLoading = false;

  List<PendingAppointment> get appointments => _appointments;
  bool get isLoading => _isLoading;

  Future<void> loadAppointments() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    _appointments = PendingAppointment.generateMockData();
    _isLoading = false;
  }

  Future<void> cancelAppointment(String id) async {
    // In a real app, this would call your API
    await Future.delayed(const Duration(seconds: 1));
    print('Appointment $id cancelled');
  }
}