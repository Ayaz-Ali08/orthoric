import 'package:flutter/material.dart';
import 'package:orthorec/TMO/Tmo_Controller/Appointment_Controller/pending_appointment.dart';
import 'package:orthorec/TMO/Tmo_Models/Appointment_Model/pending_appointment.dart';

import '../../Tmo_Core/Utils/constant_Functions.dart';

class PendingAppointmentScreen extends StatefulWidget {
  const PendingAppointmentScreen({super.key});

  @override
  State<PendingAppointmentScreen> createState() =>
      _PendingAppointmentScreenState();
}

class _PendingAppointmentScreenState extends State<PendingAppointmentScreen> {
  final PendingAppointmentController _controller =
      PendingAppointmentController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _controller.loadAppointments();
    setState(() {});
  }

  Future<void> _handleCancel(String id) async {
    await _controller.cancelAppointment(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Appointment cancelled successfully')),
    );
    _loadData(); // Refresh the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appointments_AppBar(Theme.of(context).colorScheme.primary),
          SizedBox(
            height: 12,
          ),
          Text(
            "Pending Appointment",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: _controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: _controller.appointments.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final appointment = _controller.appointments[index];
                      return AppointmentCard(
                        appointment: appointment,
                        onCancel: () => _handleCancel(appointment.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final PendingAppointment appointment;
  final VoidCallback onCancel;

  const AppointmentCard({
    super.key,
    required this.appointment,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.black,
                ),
                const SizedBox(width: 08),
                Text(
                  appointment.patientName,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                Text(
                  appointment.condition,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: onCancel,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(300),
                  backgroundColor: Color(0xff415a77),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(120, 40),
                  // width, height
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                child: const Text('Cancel '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
