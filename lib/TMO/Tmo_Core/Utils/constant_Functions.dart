import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orthorec/TMO/Tmo_Models/Patient/patientrecordModel.dart';
import 'package:orthorec/TMO/Tmo_Models/Appointment_Model/Missed_appointment.dart';



void showFullScreenImage(BuildContext context, String imagePath) {
  if (imagePath == null || imagePath.isEmpty) return;
  showDialog(
    context: context,
    builder: (context) =>
        Dialog(
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 4.0,
            child: Image.file(File(imagePath), fit: BoxFit.contain),
          ),
        ),
  );
}
class ImageUtils {
  static void showImageSourceDialog({
    required BuildContext context,
    required PatientRecordModel photo,
    required Future<void> Function(PatientRecordModel photo, ImageSource source) onImageSelected,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () async {
                Navigator.pop(context);
                await onImageSelected(photo, ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () async {
                Navigator.pop(context);
                await onImageSelected(photo, ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback ontap;
  final String buttonName;

  const AppointmentCard({
    required this.buttonName,
    required this.appointment,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 08,
                ),
                Text(
                  appointment.patientName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                Text(
                  appointment.condition,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(300),
                  backgroundColor: Color(0xff415a77),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(120, 40),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                onPressed: ontap,
                child: Text(buttonName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Rectanglerounded_Button extends StatelessWidget {
  final String lable ;
  final String imagepath ;
  final VoidCallback ontap ;
  Rectanglerounded_Button({required this.lable , required this.imagepath, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: ontap,
          child: Container(
            // margin: EdgeInsets.all(10),
            height:80,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(38)),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SvgPicture.asset(imagepath,color: Colors.white,width: 45,height: 45,)),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    lable,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Primary App Bar on Many Screen In appaointments
Widget Appointments_AppBar (Color color  ){

  return  Container(
    width: double.infinity,
    height: 100,
    color:color,
  );
}

