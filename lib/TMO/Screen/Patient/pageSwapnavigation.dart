import 'package:flutter/material.dart';
import 'package:orthorec/TMO/Screen/Patient/PatientRecord_5Screen.dart';
import 'package:orthorec/TMO/Screen/Patient/Patientrecord_1scren.dart';
import 'package:orthorec/TMO/Screen/Patient/Patientrecord_3scren.dart';
import 'package:orthorec/TMO/Screen/Patient/Patientrecord_4Screen.dart';
import 'package:orthorec/TMO/Screen/Patient/TableView.dart';
import 'package:orthorec/TMO/Screen/Patient/patientrecord_2scren.dart';

class SwapNavigationScreen extends StatefulWidget {
  const SwapNavigationScreen({super.key});

  @override
  State<SwapNavigationScreen> createState() => _SwapNavigationScreenState();
}

class _SwapNavigationScreenState extends State<SwapNavigationScreen> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const BouncingScrollPhysics(), // Optional: makes it smoother
        children: [
          const PatientRecord_1Scren(),
          const PatientRecord_2Scren(),
          const Patientrecord3scren(),
          const Patientrecord4screen(),
          const Patientrecord5screen(),
          CephalometricAnalysisTable(),
        ],
      ),
    );
  }
}
