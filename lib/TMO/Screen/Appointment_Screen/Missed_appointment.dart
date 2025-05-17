import 'package:flutter/material.dart';
import 'package:orthorec/TMO/Tmo_Controller/Appointment_Controller/Missed_appointment_Controller.dart';
import 'package:orthorec/TMO/Tmo_Models/Appointment_Model/Missed_appointment.dart';
import '../../Tmo_Core/Utils/constant_Functions.dart';

class MissedAppointmentScreen extends StatefulWidget {
  const MissedAppointmentScreen({super.key});

  @override
  State<MissedAppointmentScreen> createState() =>
      _MissedAppointmentScreenState();
}

class _MissedAppointmentScreenState extends State<MissedAppointmentScreen> {
  final AppointmentController _controller = AppointmentController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    setState(() => _isLoading = true);
    await _controller.loadMissedAppointments();
    setState(() => _isLoading = false);
  }

  Future<void> _showRescheduleDialog(Appointment appointment) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      await _handleReschedule(appointment.id, pickedDate);
    }
  }

  Future<void> _handleReschedule(String appointmentId, DateTime newDate) async {
    setState(() => _isLoading = true);
    try {
      await _controller.rescheduleAppointment(appointmentId, newDate);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Rescheduled to ${newDate.toLocal().toString().split(' ')[0]}')),
      );
      await _loadAppointments();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to reschedule: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appointments_AppBar(Theme.of(context).colorScheme.primary),
          Text(
            "Missed Appointment",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: _isLoading && _controller.missedAppointments.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _controller.missedAppointments.length,
                    itemBuilder: (context, index) {
                      final appointment = _controller.missedAppointments[index];
                      return AppointmentCard(
                        buttonName: "Reschedule",
                        appointment: appointment,
                        ontap: () => _showRescheduleDialog(appointment),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}


