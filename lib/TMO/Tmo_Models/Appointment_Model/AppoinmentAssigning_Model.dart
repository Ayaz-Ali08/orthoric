class AppointmentAssiging {
  final String Name;

  final String doj;

  final String Number;

  final String City;
  final String geder;
  final String patient;

  AppointmentAssiging({
    required this.Name,
    required this.doj,
    required this.Number,
    required this.City,
    required this.geder,
    required this.patient,
  });

  factory AppointmentAssiging.demo() {
   return AppointmentAssiging(
        Name: "Dr.Teeth",
        doj: "11/08/023",
        Number: '+92 348-9340243 ',
        City: "Mingora",
        geder: "Male",
        patient: "Khan Shab",
   );
  }
}
