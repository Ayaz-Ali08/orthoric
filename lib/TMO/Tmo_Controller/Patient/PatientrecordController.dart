import 'package:image_picker/image_picker.dart';

import 'package:orthorec/TMO/Tmo_Models/Patient/patientrecordModel.dart';


class PatientRecordController {
  final ImagePicker _picker = ImagePicker();
  List<PatientRecordModel> photos = [
    PatientRecordModel(id: '1', title: 'Frontal at rest'),
    PatientRecordModel(id: '2', title: 'Frontal at smile'),
    PatientRecordModel(id: '3', title: 'Right profile at rest'),
    PatientRecordModel(id: '4', title: 'Oblique at rest'),
    PatientRecordModel(id: '5', title: 'Anterior '),
    PatientRecordModel(id: '6', title: 'Right buccal '),
    PatientRecordModel(id: '7', title: 'Left buccal '),
    PatientRecordModel(id: '8', title: ' Upper occlusal'),
    PatientRecordModel(id: '9', title: ' Lower occlusal'),
    PatientRecordModel(id: '10', title: 'Anterior'),
    PatientRecordModel(id: '11', title: 'Right buccal'),
    PatientRecordModel(id: '12', title: 'Left buccal'),
    PatientRecordModel(id: '13', title: ' Upper occlusal'),
    PatientRecordModel(id: '14', title: ' Lower occlusal'),
    PatientRecordModel(id: '15', title: 'Anterior'),
    PatientRecordModel(id: '16 ', title: 'Anterior'),
  ];

  Future<void> selectImage(PatientRecordModel photo) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1500,
      maxHeight: 1500,
      imageQuality: 80,
    );
    if (image != null) {
      photo.imagePath = image.path;
    }
  }

  Future<void> captureImage(PatientRecordModel photo) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1500,
      maxHeight: 1500,
      imageQuality: 80,
    );
    if (image != null) {
      photo.imagePath = image.path;
    }
  }
}
