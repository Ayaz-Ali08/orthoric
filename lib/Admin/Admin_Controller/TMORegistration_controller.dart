
import 'package:orthorec/Admin/Admin_Model/TmoRegistration_Model.dart';

class TMORegistrationCon {
  Future<void> SubmitForm(TmoregistrationModel  data )async {
  // Implamentation of Sub,ission logic 
    print("Submitting Form : ${data.toJson()}");
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
  }
}