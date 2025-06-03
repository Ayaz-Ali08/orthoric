import 'package:flutter/material.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'Reception/Reception_View/InlinePatient_Screen.dart';
import 'Reception/Reception_View/PatientRegistrationRec.dart';
import 'Reception/Reception_View/TmoDateAsigning_ReceptionScreen.dart';
import 'Supervisor/Supervisor_View/Supervisor_Dashbord_Screen.dart';
import 'Supervisor/Supervisor_View/PatientRecord_Screen.dart';
import 'Supervisor/Supervisor_View/TMOList_admScreen.dart';
import 'Supervisor/Supervisor_View/TMOregistrion_Screen.dart';
import 'TMO/Screen/AppointmentAssiging_Screen.dart';
import 'TMO/Screen/Patient/TableView.dart';
import 'View/login_screen.dart';
import 'TMO/Screen/Tmo_dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final userRole = prefs.getString('userRole') ?? '';

  runApp(MyApp(isLoggedIn: isLoggedIn, userRole: userRole));
}


class MyApp extends StatelessWidget {

  final bool isLoggedIn;
  final String userRole;

  const MyApp({super.key, required this.isLoggedIn, required this.userRole});

  @override
  Widget build(BuildContext context) {

    Widget home;

    if (!isLoggedIn) {
      home = const SplashScreen();
    } else if (userRole.startsWith('ad')) {
      home = Supervisor_DashboardScreen();
    } else if (userRole.startsWith('pa')) {
      home = const PatientDashBoardScreen(patientId: "1");
    } else if (userRole.startsWith('tm')) {
      home = const DashboardScreen();
    } else if (userRole.startsWith('re')) {
      home = const ReceptionDashbordScreen();
    } else {
      home = const SplashScreen();
    }
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
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const SplashScreen());
        }

        final routes = {
          '/login': const LoginScreen(),
          '/tmodashboard': const DashboardScreen(),
          '/todayAppointment': TodayAppointmentScreen(),
          '/missedAppointments': const MissedAppointmentScreen(),
          '/pendingAppointments': PendingAppointmentScreen(),
          '/treatmentProgress': const TreatmentProgressScreen(),
          '/patientrecord_1': const PatientRecord_1Scren(),
          '/patientrecord_2': const PatientRecord_2Scren(),
          '/patientrecord_3': const Patientrecord3scren(),
          '/patientrecord_4': const Patientrecord4screen(),
          '/patientrecord_5': const Patientrecord5screen(),
          '/table':  CephalometricAnalysisTable(),
          '/AdminDashbord': Supervisor_DashboardScreen(),
          '/tmoRegistration': TmoregistrionScreen(),
          '/tmoList': TMOListScreen(),
          '/dateWiseRecord': DatewiseRecord_Screen(),
          '/receptiondashboard': ReceptionDashbordScreen(),
          '/inlinePatient': InlinePatientScreen(),
          '/newPatientEntry': PatientRegistion_ScreenREc(),
          '/tmodateAssigning': TmoAndDateAssigScreen(),
          '/patientDashbord': PatientDashBoardScreen(patientId: "1"),
          '/appoinmentAssigning': AppointmentAssigingScreen(),
        };

        final route = routes[settings.name];

        if (route != null) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => route,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.5);
              const end = Offset.zero;
              const curve = Curves.linear;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }
        return null;
      },home: home,
    );
  }
}