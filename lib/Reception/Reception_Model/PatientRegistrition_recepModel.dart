class PatientRegistration {
  String name;
  String dob;
  String fatherName;
  String contactNumber;
  String address;
  String gender;
  String disease;

  PatientRegistration({
    required this.name,
    required this.dob,
    required this.fatherName,
    required this.contactNumber,
    required this.address,
    required this.gender,
    required this.disease,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'dob': dob,
    'fatherName': fatherName,
    'contactNumber': contactNumber,
    'address': address,
    'gender': gender,
    'disease': disease,
  };
}