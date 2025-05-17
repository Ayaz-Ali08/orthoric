import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orthorec/TMO/Tmo_Core/Utils/constant_Functions.dart';
import '../Reception_Controller/ReceptionDashBoardController.dart';
import '../Reception_Model/ReceptionDashBoardModel.dart';

class ReceptionDashbordScreen extends StatefulWidget {

  const ReceptionDashbordScreen({super.key});

  @override
  State<ReceptionDashbordScreen> createState() =>
      _ReceptionDashbordScreenState();
}

class _ReceptionDashbordScreenState extends State<ReceptionDashbordScreen> {
  final ReceptionDashboradController _controller =
      ReceptionDashboradController();
  late List<ReceptionDashBordModels> _entries;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    setState(() => _isLoading = true);
    _entries = _controller.getTodaysEntries();
    setState(() => _isLoading = false);
  }

  // Future<void> _showNewEntryDialog() async {
  //   final result = await showDialog(
  //     context: context,
  //     builder: (context) => const NewEntryDialog(),
  //   );
  //
  //   if (result != null) {
  //     await _handleNewEntry(result);
  //   }
  // }

  Future<void> _handleNewEntry(Map<String, dynamic> data) async {
    setState(() => _isLoading = true);
    try {
      await _controller.createNewEntry(data);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New entry created successfully')),
      );
      await _loadEntries();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appointments_AppBar(Theme.of(context).colorScheme.primary),
          SizedBox(
            height: 330,
          ),
          _receptiondashboardButton(
              img: "Assets/In_Line_Patient", ontap: () {
                Navigator.pushNamed(context, "/inlinePatient");
          }, label: 'Inline Patient'),
          _receptiondashboardButton(
              img: "Assets/In_Line_Patient", ontap: () {
                Navigator.pushNamed(context, "/newPatientEntry");
          }, label: 'New Entry'),
        ],
      ),
    );
  }
}

class _receptiondashboardButton extends StatelessWidget {
  final String img;
  final VoidCallback ontap;

  final String label;

  _receptiondashboardButton(
      {required this.img, required this.ontap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical :4 ,horizontal: 8),
              child: SvgPicture.asset(img, color: Colors.white, width: 40,height: 40,),

            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical :4 ,horizontal: 8),
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
