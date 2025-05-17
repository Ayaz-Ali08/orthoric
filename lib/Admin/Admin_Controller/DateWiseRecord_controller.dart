class TMO {
  final String name;
  TMO({required this.name});
}

class Patient {
  final String name;
  Patient({required this.name});
}

class TmoPatientController {
  List<TMO> tmos = [];
  List<Patient> patients = [];

  TMO? selectedTmo;
  Patient? selectedPatient;
  DateTime selectedDate = DateTime.now();

  TmoPatientController() {
    loadInitialData();
  }

  void loadInitialData() {
    tmos = [TMO(name: 'TMO 1'), TMO(name: 'TMO 2')];
    patients = [Patient(name: 'Patient A'), Patient(name: 'Patient B')];
  }

  void selectTMO(TMO tmo) {
    selectedTmo = tmo;
  }

  void selectPatient(Patient patient) {
    selectedPatient = patient;
  }

  void selectDate(DateTime date) {
    selectedDate = date;
  }
}
