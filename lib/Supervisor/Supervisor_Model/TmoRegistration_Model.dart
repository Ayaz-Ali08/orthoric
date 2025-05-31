class TmoregistrationModel{
  String name;
  String dob;
  String experince;
  String contactNumber;
  String address;
  String gender;
  String doj;

  TmoregistrationModel({
    required this.name,
    required this.dob,
    required this.experince,
    required this.contactNumber,
    required this.address,
    required this.gender,
    required this.doj,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'dob': dob,
    'fatherName': experince,
    'contactNumber': contactNumber,
    'address': address,
    'gender': gender,
    'disease': doj,
  };
}