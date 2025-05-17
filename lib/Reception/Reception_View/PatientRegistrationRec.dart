import 'package:flutter/material.dart';
import 'package:orthorec/Core/Utils/constant_Functions.dart';
import 'package:orthorec/Reception/Reception_Model/PatientRegistrition_recepModel.dart';
import 'package:orthorec/Reception/Reception_Controller/PatientRegistration_Recep_Controller.dart';
import 'package:orthorec/TMO/Tmo_Core/Utils/constant_Functions.dart';

class PatientRegistion_ScreenREc extends StatefulWidget {
  const PatientRegistion_ScreenREc({super.key});

  @override
  State<PatientRegistion_ScreenREc> createState() =>
      _PatientRegistion_ScreenREcState();
}

class _PatientRegistion_ScreenREcState
    extends State<PatientRegistion_ScreenREc> {
  final _formKey = GlobalKey<FormState>();
  final _controller = PatientController();
  final _registration = PatientRegistration(
    name: '',
    dob: '',
    fatherName: '',
    contactNumber: '',
    address: '',
    gender: '',
    disease: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Appointments_AppBar(Theme.of(context).colorScheme.primary),
            SizedBox(
              height: 14,
            ),
            Text(
              'Patient Registration',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 65),
                children: [
                  SizedBox(
                    height: 26,
                  ),
                  buildTextField('Name', (value) => _registration.name = value),
                  DobPickerField(
                    label: "DOB",
                    onChanged: (value) => _registration.dob = value,
                  ),
                  buildTextField('Father name',
                      (value) => _registration.fatherName = value),
                  buildTextField('Contact number',
                      (value) => _registration.contactNumber = value),
                  buildTextField(
                      'Address', (value) => _registration.address = value),
                  buildDropdown('Gender', ['Male', 'Female', 'Other'],
                      (value) => _registration.gender = value!),
                  buildTextField(
                      'Disease', (value) => _registration.disease = value),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: _submitForm,
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _controller.submitForm(_registration);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }
}
