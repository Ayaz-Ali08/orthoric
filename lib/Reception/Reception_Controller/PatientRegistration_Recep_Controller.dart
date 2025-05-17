import 'package:orthorec/Reception/Reception_Model/PatientRegistrition_recepModel.dart';
class PatientController {
  Future<void> submitForm(PatientRegistration data) async {
    // Implement your submission logic here
    print('Submitting form: ${data.toJson()}');
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
  }
}