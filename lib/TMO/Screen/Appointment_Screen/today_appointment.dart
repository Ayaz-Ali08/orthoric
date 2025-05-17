import 'package:flutter/material.dart';
import 'package:orthorec/TMO/Tmo_Controller/Appointment_Controller/Today_appointment_controller.dart';
import 'package:orthorec/TMO/Tmo_Models/Appointment_Model/Today_appointment.dart';

import '../../Tmo_Core/Utils/constant_Functions.dart';
class TodayAppointmentScreen extends StatelessWidget {
  final AppointmentController controller = AppointmentController();

  TodayAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AppointmentModel> appointments = controller.fetchTodayAppointments();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
        body: Column(
          children: [
            Appointments_AppBar(Theme.of(context).colorScheme.primary),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final item = appointments[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/patientrecord_5', // your route name
                        arguments: item,      // pass the appointment data
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(50),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.person, size: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            item.diagnosis,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}
