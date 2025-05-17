import 'package:flutter/material.dart';
import 'package:orthorec/Admin/Admin_View/Admin_Dashbord_Screen.dart';
import 'package:orthorec/Reception/Reception_View/ReceptionDashBoardScreen.dart';
import 'package:orthorec/View/splash_screen.dart';
import 'package:orthorec/patient/Patient_view/PatientDashbord%20Screen.dart';
import 'package:orthorec/tmo/Screen/Appointment_Screen/Missed_appointment.dart';
import 'package:orthorec/tmo/Screen/Appointment_Screen/pending_appointment.dart';
import 'package:orthorec/tmo/Screen/Appointment_Screen/today_appointment.dart';
import 'package:orthorec/tmo/Screen/Patient/PatientRecord_5Screen.dart';
import 'package:orthorec/tmo/Screen/Patient/Patientrecord_1scren.dart';
import 'package:orthorec/tmo/Screen/Patient/Patientrecord_3scren.dart';
import 'package:orthorec/tmo/Screen/Patient/Patientrecord_4Screen.dart';
import 'package:orthorec/tmo/Screen/Patient/patientrecord_2scren.dart';
import 'package:orthorec/tmo/Screen/TreatmentProgress_Screen.dart';
import 'Admin/Admin_View/DateWiseRecord_Screen.dart';
import 'Admin/Admin_View/TMOList_admScreen.dart';
import 'Admin/Admin_View/TMOregistrion_Screen.dart';
import 'Reception/Reception_View/InlinePatient_Screen.dart';
import 'Reception/Reception_View/PatientRegistrationRec.dart';
import 'Reception/Reception_View/TmoDateAsigning_ReceptionScreen.dart';
import 'View/login_screen.dart';
import 'TMO/Screen/Tmo_dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Orthodontics Department',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Color(0xff415a77),      // Primary color
          secondary: Colors.teal,    // Secondary (accent) color
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        useMaterial3: true, // Optional, for Material Design 3
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/tmodashboard': (context) => const DashboardScreen(),
        '/todayAppointment': (context) =>  TodayAppointmentScreen(),
        '/missedAppointments': (context) => const MissedAppointmentScreen(),
        '/pendingAppointments': (context) =>  PendingAppointmentScreen(),
        '/treatmentProgress': (context) => const TreatmentProgressScreen(),
        '/patientrecord_1':(context)=> const PatientRecord_1Scren(),
        '/patientrecord_2':(context)=> const PatientRecord_2Scren(),
        '/patientrecord_3':(context)=> const Patientrecord3scren(),
        '/patientrecord_4':(context)=> const Patientrecord4screen(),
        '/patientrecord_5':(context)=> const Patientrecord5screen(),
        '/AdminDashbord':(context)=>  Admin_DashboardScreen(),
        '/tmoRegistration':(context)=>  TmoregistrionScreen(),
        '/tmoList':(context)=>  TMOListScreen(),
        '/dateWiseRecord': (context) => DatewiseRecord_Screen(),
        '/receptiondashboard':(context)=>  ReceptionDashbordScreen(),
        '/inlinePatient':(context)=>  InlinePatientScreen(),
        '/newPatientEntry':(context)=>  PatientRegistion_ScreenREc(),
        '/tmodateAssigning':(context)=>  TmoAndDateAssigScreen(),
        '/patientDashbord':(context)=>  PatientDashBoardScreen(patientId: "1"),

      },
    );
  }
}