import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orthorec/TMO/Tmo_Models/Patient/patientrecordModel.dart';
import 'package:orthorec/TMO/Tmo_Controller/Patient/PatientrecordController.dart';
import '../../Tmo_Core/Utils/constant_Functions.dart';
import 'Patientrecord_3scren.dart';

class Patientrecord5screen extends StatefulWidget {
  const Patientrecord5screen({super.key});

  @override
  State<Patientrecord5screen> createState() => _Patientrecord5screenState();
}

class _Patientrecord5screenState extends State<Patientrecord5screen> {
  bool _isUploading = false;

  void _showImageDialog(PatientRecordModel photo) {
    ImageUtils.showImageSourceDialog(
      context: context,
      photo: photo,
      onImageSelected: _handleImageSelection,
    );
  }

  Future<void> _handleImageSelection(
      PatientRecordModel photo, ImageSource source) async {
    setState(() => _isUploading = true);
    try {
      await _controller.captureImage(photo); // Add source if needed
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Image added")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() => _isUploading = false);
    }
  }

  final PatientRecordController _controller = PatientRecordController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _isUploading
              ? const Center(child: CircularProgressIndicator())
              : LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SECTION 1. PRE-TREATMENT ASSESSMENT ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "  1.1 Pre-Treatment photographs ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "  EXTRA-ORAL ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: PhotoUploadCard(
                                photo: _controller.photos[4],
                                onAddPhoto: () =>
                                    _showImageDialog(_controller.photos[4]),
                                onViewPhoto: () =>
                                    _controller.photos[4].imagePath != null
                                        ? () => showFullScreenImage(context,
                                            _controller.photos[4].imagePath!)
                                        : null,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            RoundIconButton(
                              Icons.arrow_back_ios_new_outlined,
                              () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  },
                )),
    );
  }
}

class PhotoUploadCard extends StatelessWidget {
  final PatientRecordModel photo;
  final VoidCallback onAddPhoto;
  final VoidCallback? onViewPhoto;

  const PhotoUploadCard({
    Key? key,
    required this.photo,
    required this.onAddPhoto,
    this.onViewPhoto, // <-- allow null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const cardSpacing = 16.0; // horizontal padding/margin
    const row = 2; // you can make this dynamic based on screenWidth
    final cardWidth = (screenWidth - ((row + 1) * cardSpacing)) / row;
    final cardHeight = cardWidth * 1.4; // Maintain aspect ratio

    return Container(
      width: cardWidth,
      height: cardHeight - 60,
      margin: const EdgeInsets.all(cardSpacing / 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "(${photo.title})",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: photo.imagePath != null ? onViewPhoto : onAddPhoto,
            child: Container(
              width: double.infinity,
              height: cardHeight - 120,
              // adjust for title + padding
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[100],
              ),
              child: photo.imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(photo.imagePath!),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_a_photo,
                            size: 30, color: Color(0xffc0bfbf)),
                        SizedBox(height: 8),
                        Text("Upload Image", style: TextStyle(fontSize: 12)),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
