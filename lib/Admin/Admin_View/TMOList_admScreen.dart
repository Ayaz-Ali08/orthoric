import 'package:flutter/material.dart';
import 'package:orthorec/Admin/Admin_Controller/TMOList_AdmCon.dart';
import 'package:orthorec/Admin/Admin_Model/TMOList_Admmodel.dart';
import 'package:orthorec/TMO/Tmo_Core/Utils/constant_Functions.dart';

class TMOListScreen extends StatelessWidget {
  final TMOController _controller = TMOController();

  TMOListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tmoList = _controller.getTMOList();

    return Scaffold(
      body: Column(
        children: [
          Appointments_AppBar(Theme.of(context).colorScheme.primary),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              "TMO List",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: tmoList.length,
              itemBuilder: (context, index) {
                final tmo = tmoList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: _buildDoctorAvatar(tmo, context),
                    title: Text(
                      tmo.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


Widget _buildDoctorAvatar(TMO doctor, BuildContext context) {
  final theme = Theme.of(context);

  return CircleAvatar(
    radius: 24,
    backgroundColor: theme.primaryColor.withOpacity(0.1),
    child: doctor.photoUrl != null
        ? ClipOval(
      child: Image.network(
        doctor.photoUrl!,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
          );
        },
        errorBuilder: (context, error, stackTrace) => _buildFallbackIcon(theme),
      ),
    )
        : _buildFallbackIcon(theme),
  );
}

Widget _buildFallbackIcon(ThemeData theme) {
  return Icon(
    Icons.person,
    size: 24,
    color: theme.primaryColor,
  );
}