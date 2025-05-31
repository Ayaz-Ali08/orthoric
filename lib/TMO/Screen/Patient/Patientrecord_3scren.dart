import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orthorec/TMO/Tmo_Models/Patient/patientrecordModel.dart';
import 'package:orthorec/TMO/Tmo_Controller/Patient/PatientrecordController.dart';

import '../../Tmo_Core/Utils/constant_Functions.dart';

class Patientrecord3scren extends StatefulWidget {
  const Patientrecord3scren({super.key});

  @override
  State<Patientrecord3scren> createState() => _Patientrecord3screnState();
}

class _Patientrecord3screnState extends State<Patientrecord3scren> {
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
                : LayoutBuilder(builder: (context, constraints) {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          "  PRE-TREATMENT STUDY MODEL",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: PhotoUploadCard(
                                photo: _controller.photos[9],
                                onAddPhoto: () =>
                                    _showImageDialog(_controller.photos[9]),
                                onViewPhoto:
                                    _controller.photos[9].imagePath != null
                                        ? () => showFullScreenImage(context,
                                            _controller.photos[9].imagePath!)
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
                                photo: _controller.photos[10],
                                onAddPhoto: () =>
                                    _showImageDialog(_controller.photos[10]),
                                onViewPhoto:
                                    _controller.photos[10].imagePath != null
                                        ? () => showFullScreenImage(context,
                                            _controller.photos[10].imagePath!)
                                        : null,
                              ),
                            ),
                            Expanded(
                              child: PhotoUploadCard(
                                photo: _controller.photos[11],
                                onAddPhoto: () =>
                                    _showImageDialog(_controller.photos[11]),
                                onViewPhoto:
                                    _controller.photos[11].imagePath != null
                                        ? () => showFullScreenImage(context,
                                            _controller.photos[11].imagePath!)
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
                                photo: _controller.photos[12],
                                onAddPhoto: () =>
                                    _showImageDialog(_controller.photos[12]),
                                onViewPhoto:
                                    _controller.photos[12].imagePath != null
                                        ? () => showFullScreenImage(context,
                                            _controller.photos[12].imagePath!)
                                        : null,
                              ),
                            ),
                            Expanded(
                              child: PhotoUploadCard(
                                photo: _controller.photos[13],
                                onAddPhoto: () =>
                                    _showImageDialog(_controller.photos[13]),
                                onViewPhoto:
                                    _controller.photos[13].imagePath != null
                                        ? () => showFullScreenImage(context,
                                            _controller.photos[13].imagePath!)
                                        : null,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                    context, "/patientrecord_4");
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  })));
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

Widget RoundIconButton(
  final IconData icon,
  final VoidCallback ontap,
) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color(0xff415a77),
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: ontap,
      icon: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
    ),
  );
}
