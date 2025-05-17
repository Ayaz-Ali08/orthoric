class PatientRecordModel {
  final String id;
  final String title;
  String? imagePath;

  PatientRecordModel({
    required this.id,
    required this.title,
    this.imagePath,
  });
}