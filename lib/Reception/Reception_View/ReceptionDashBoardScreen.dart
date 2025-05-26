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

class _ReceptionDashbordScreenState extends State<ReceptionDashbordScreen> with SingleTickerProviderStateMixin {
  final ReceptionDashboradController _controller =
      ReceptionDashboradController();
  late List<ReceptionDashBordModels> _entries;
  bool _isLoading = false;
  late AnimationController _animationController ;
  late Animation<Offset> _animation ;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
        begin: Offset(0, -1), // Start from offscreen
        end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    setState(() => _isLoading = true);
    _entries = _controller.getTodaysEntries();
    setState(() => _isLoading = false);
  }

@override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _animation,
        child: Column(
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
