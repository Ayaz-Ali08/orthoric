import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orthorec/TMO/Tmo_Models/Patient/patientrecordModel.dart';
import 'package:orthorec/TMO/Tmo_Controller/Patient/PatientrecordController.dart';
import '../../Tmo_Core/Utils/constant_Functions.dart';
import 'Patientrecord_3scren.dart';

class PatientRecord_1Scren extends StatefulWidget {
  const PatientRecord_1Scren({super.key});

  @override
  State<PatientRecord_1Scren> createState() => _PatientRecord_1ScrenState();
}

class _PatientRecord_1ScrenState extends State<PatientRecord_1Scren> {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      const Text(
                        '  PRE-TREATMENT PHOTOGRAPH : \n   EXTRA-ORAL',
                        style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: PhotoUploadCard(
                              photo: _controller.photos[0],
                              onAddPhoto: () =>
                                  _showImageDialog(_controller.photos[0]),
                              onViewPhoto:
                              _controller.photos[0].imagePath != null
                                  ? () => showFullScreenImage(context,
                                  _controller.photos[0].imagePath!)
                                  : null,
                            ),
                          ),
                          Expanded(
                            child: PhotoUploadCard(
                              photo: _controller.photos[1],
                              onAddPhoto: () =>
                                  _showImageDialog(_controller.photos[1]),
                              onViewPhoto:
                              _controller.photos[1].imagePath != null
                                  ? () => showFullScreenImage(context,
                                  _controller.photos[1].imagePath!)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: PhotoUploadCard(
                              photo: _controller.photos[2],
                              onAddPhoto: () =>
                                   _showImageDialog(_controller.photos[2]),
                              onViewPhoto:
                              _controller.photos[2].imagePath != null
                                  ? () => showFullScreenImage(context,
                                  _controller.photos[2].imagePath!)
                                  : null,
                            ),
                          ),
                          Expanded(
                            child: PhotoUploadCard(
                              photo: _controller.photos[3],
                              onAddPhoto: () =>
                                  _showImageDialog(_controller.photos[3]),
                              onViewPhoto:
                              _controller.photos[3].imagePath != null
                                  ? () => showFullScreenImage(context,
                                  _controller.photos[3].imagePath!)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RoundIconButton(
                            Icons.arrow_back_ios_new_outlined,
                                () {
                              Navigator.pop(context);
                            },
                          ),
                          RoundIconButton(
                            Icons.arrow_forward_ios_rounded,
                                () {
                              Navigator.pushNamed(
                                  context, "/patientrecord_2");
                            },
                          ),
                        ],
                      )

                    ],
                  );
                },
              ),
      ),
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
      height: cardHeight+30,
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
              height: cardHeight -30,
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
