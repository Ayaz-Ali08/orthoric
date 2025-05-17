class PatientDashbordModel {
  final String id;
  final String name;
  final String dob;
  final String gender;
  final String phone;
  final String city;
  final String lastVisitDate;
  final String previousTreatment;
  final String nextAppointment;
  final String tmoName;

  const PatientDashbordModel({
    required this.id,
    required this.name,
    required this.dob,
    required this.gender,
    required this.phone,
    required this.city,
    required this.lastVisitDate,
    required this.previousTreatment,
    required this.nextAppointment,
    required this.tmoName,
  });

  factory PatientDashbordModel.demo() {
    return const  PatientDashbordModel(
        id: '1',
        name: 'Jan Alam',
        dob: '11/08/1990',
        gender: 'Male',
        phone: '+92-333-300000',
        city: 'Mingora, Swat',
        lastVisitDate: '11/08/2025',
        previousTreatment: 'Gingivitis',
        nextAppointment: '25/08/2025',
        tmoName: ' Dr.Waqar',
    );
  }
}
