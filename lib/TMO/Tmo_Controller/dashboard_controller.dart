import 'package:flutter/material.dart';

class DashboardController {
  Future<Map<String, dynamic>> fetchDoctorProfile() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    return {
      'name': 'Dr. Teeth',
      'doj': '11/08/23',
      'experience': '3 Y 1 M',
      'specialty': 'Dentistry',
      'phone': '+92-333-3-000000',
      'appointments': 24,  // Example count
      'treatments': 15,    // Example count
    };
  }

  Future<List<Map<String, dynamic>>> fetchQuickActions() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      {'title': 'Appointment_Model', 'icon': Icons.calendar_today},
      {'title': 'Treatment', 'icon': Icons.medical_services},
      {'title': 'Details', 'icon': Icons.info_outline},
      {'title': 'Progress', 'icon': Icons.timeline},
      {'title': 'Patient Record', 'icon': Icons.assignment},
    ];
  }
}