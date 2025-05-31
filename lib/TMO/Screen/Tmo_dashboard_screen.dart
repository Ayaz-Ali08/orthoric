import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:orthorec/Core/Utils/constant_Functions.dart';
import 'package:orthorec/TMO/Tmo_Controller/dashboard_controller.dart';
import 'package:orthorec/TMO/Tmo_Core/Utils/constant_Functions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final DashboardController _controller = DashboardController();
  late Future<Map<String, dynamic>> _profileFuture;
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
            begin: Offset(0, -1), // Start from offscreen
            end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
    _profileFuture = _controller.fetchDoctorProfile();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashbordAppBar(),
          FutureBuilder(
            future: _profileFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final profile = snapshot.data!;
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
                    // Top padding increased
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 55),
                        AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText(
                                profile['name'],
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23
                              )
                            )],
                        ),
                        const SizedBox(height: 30),
                        Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.all(8),
                          // color: Color(0xffc0bfbf),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 12, 60, 8),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _buildProfileRow('DOJ', profile['doj']),
                                  _buildProfileRow(
                                      'Experience', profile['experience']),
                                  _buildProfileRow(
                                      'Specialty', profile['specialty']),
                                  _buildProfileRow(
                                      'Number', profile['phone']),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -60, // Half of avatar height
                    child: CircleAvatar(
                        radius: 70,
                        // backgroundColor: Colors.lightBlueAccent,
                        backgroundImage: NetworkImage(
                            "https://images.drlogy.com/assets/uploads/img/practice-profile/hospitals/profile/dant-aarogyam-seva-sadan-e50f7e6102d-36c694851ab.png") // or NetworkImage(...)
                        ),
                  ),
                ],
              );
            },
          ),
          Rectanglerounded_Button(
            lable: "Appointment Details",
            imagepath: "Assets/Appointment_detail.svg",
            ontap: () => showAppointmentPopup(context),
          ),
          Rectanglerounded_Button(
            lable: "Treatment Progress",
            imagepath: "Assets/Treatment_progress.svg",
            ontap: () {
              Navigator.pushNamed(context, "/treatmentProgress");
            },
          ),
          Rectanglerounded_Button(
            lable: "Patient Record",
            imagepath: "Assets/Doctor_Registration.svg",
            // "Assets/logo.png",
            ontap: () {
              Navigator.pushNamed(context, "/patientrecord_1");
            },
          ),
          Rectanglerounded_Button(
            lable: "Appointments",
            imagepath: "Assets/Doctor_Registration.svg",
            // "Assets/logo.png",
            ontap: () {
              Navigator.pushNamed(context, "/appoinmentAssigning");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final ImageProvider? image;

  const CircularIconButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.image,
    this.size = 90,
    this.backgroundColor = const Color(0xFF324b6b),
    this.iconColor = Colors.white,
  }) : assert(icon != null || image != null,
            'Either icon or image must be provided');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(size / 2),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: Center(
              child: image != null
                  ? CircleAvatar(
                      backgroundImage: image,
                      radius: size,
                    )
                  : Icon(icon, color: iconColor, size: size / 1.5),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

void showAppointmentPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 16,
                  children: [
                    Rectanglerounded_Button(
                      lable: "Today Appointment",
                      imagepath: "Assets/Today_Appointment.svg",
                      ontap: () {
                        Navigator.pushNamed(context, '/todayAppointment');
                      },
                    ),
                    Rectanglerounded_Button(
                      lable: "Pending Appointment",
                      imagepath: "Assets/Pending_Appiontment.svg",
                      ontap: () {
                        Navigator.pushNamed(context, '/pendingAppointments');
                      },
                    ),
                    Rectanglerounded_Button(
                      lable: "Missed Appointment",
                      imagepath: "Assets/Missed_Appiontment.svg",
                      ontap: () {
                        Navigator.pushNamed(context, '/missedAppointments');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 22),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
