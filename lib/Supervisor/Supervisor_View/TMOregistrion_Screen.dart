import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orthorec/Core/Utils/constant_Functions.dart';
import 'package:orthorec/TMO/Tmo_Core/Utils/constant_Functions.dart';

import '../Supervisor_Controller/TMORegistration_controller.dart';
import '../Supervisor_Model/TmoRegistration_Model.dart';

class TmoregistrionScreen extends StatefulWidget {
  const TmoregistrionScreen({super.key});

  @override
  State<TmoregistrionScreen> createState() => _TmoregistrionScreenState();
}

class _TmoregistrionScreenState extends State<TmoregistrionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TMORegistrationCon();
  final _registration = TmoregistrationModel(
      name: '',
      dob: '',
      experince: '',
      contactNumber: '',
      address: '',
      gender: '',
      doj: '');

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
                "TMO Registration ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 65),
                  children: [
                    SizedBox(
                      height: 26,
                    ),
                    buildTextField(
                      "Name",
                      (value) => _registration.name = value,
                    ),
                    buildTextField(
                      "Contact Number",
                      (value) => _registration.contactNumber = value,
                    ),
                    buildTextField(
                      "Experience",
                      (value) => _registration.experince = value,
                    ),
                    DobPickerField(
                      label: 'DOJ',
                      onChanged: (value) => _registration.doj = value,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    DobPickerField(
                      label: 'DOB',
                      onChanged: (value) => _registration.dob = value,
                    ),
                    buildTextField(
                        "Address", (value) => _registration.address = value),
                    buildDropdown(
                      "Gender",
                      ["Male , Female , Others "],
                      (value) => _registration.gender = value!,
                    ),
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
              )
            ],
          )),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _controller.SubmitForm(_registration);
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
