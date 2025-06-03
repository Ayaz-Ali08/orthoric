import 'package:flutter/material.dart';
import 'package:orthorec/TMO/Tmo_Core/Utils/constant_Functions.dart';

import '../Reception_Controller/InlinePatient_Controller.dart';

class InlinePatientScreen extends StatefulWidget {
  InlinePatientScreen({super.key});

  @override
  State<InlinePatientScreen> createState() => _InlinePatientScreenState();
}

class _InlinePatientScreenState extends State<InlinePatientScreen> {
  final InlinePatientController _controller = InlinePatientController();

  @override
  Widget build(BuildContext context) {
    final inlinePatient = _controller.getPatients();

    return Scaffold(
      body: Column(
        children: [
          Appointments_AppBar(Theme.of(context).colorScheme.primary),
          Text(
            "Patient Waiting List ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: inlinePatient.length,
              itemBuilder: (context, index) {
                final patient = inlinePatient[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    InlinePatientRow(patient.name, patient.condition),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget InlinePatientRow(
    final String label,
    final String condition,
  ) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 40),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  label,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  condition,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/tmodateAssigning");
                    },
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Color(0xffc0bfbf)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 23,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
