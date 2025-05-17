import 'package:orthorec/TMO/Tmo_Models/Appointment_Model/Missed_appointment.dart';
class AppointmentController {
  List<Appointment> _missedAppointments = [];

  List<Appointment> get missedAppointments => _missedAppointments;

  Future<void> loadMissedAppointments() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    _missedAppointments = [
      Appointment(id: '1', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      Appointment(id: '2', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      Appointment(id: '2', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      Appointment(id: '2', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      Appointment(id: '2', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      Appointment(id: '2', patientName: 'Arshad Ali', condition: 'Gingivitis'),
      Appointment(id: '2', patientName: 'Arshad Ali', condition: 'Gingivitis'),
    ];
  }

  Future<void> rescheduleAppointment(String id, DateTime newDate) async {
    // In a real app, this would call your API
    await Future.delayed(const Duration(seconds: 1));
    print('Appointment $id rescheduled to $newDate');
  }
}