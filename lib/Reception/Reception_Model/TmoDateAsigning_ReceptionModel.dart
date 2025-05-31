class TmoAndDateAsigning {
  final String name;
  final String DOB;
  final String Gender;
  final String phone;
  final String city;
  final String Tmo;

  TmoAndDateAsigning(
      {required this.name,
      required this.DOB,
      required this.Gender,
      required this.phone,
      required this.city,
      required this.Tmo});

  factory TmoAndDateAsigning.demo() {
    return TmoAndDateAsigning(
        name: "Jan Alam",
        DOB: "1/1/2000",
        Gender: "Male",
        phone: "+92-344-0000000",
        city: "Mingora",
          Tmo: "Dr.Waqar");
  }
}
