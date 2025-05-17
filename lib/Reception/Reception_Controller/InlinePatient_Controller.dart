import 'package:orthorec/Reception/Reception_Model/InlinePatient_Model.dart';
class InlinePatientController {
  List<InlinePatient> getPatients() {
    return InlinePatient.demoPatients();
  }
}