import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orthorec/Admin/Admin_Controller/Admin_Dashbord_Controler.dart';
import 'package:orthorec/Core/Utils/constant_Functions.dart';

class Admin_DashboardScreen extends StatefulWidget {


  Admin_DashboardScreen({super.key});

  @override
  State<Admin_DashboardScreen> createState() => _Admin_DashboardScreenState();
}

class _Admin_DashboardScreenState extends State<Admin_DashboardScreen> with SingleTickerProviderStateMixin{
  final Dashbord_Controller _controller = Dashbord_Controller();

  late AnimationController _animationController;

  late Animation<Offset> _animation;

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
  }
  @override
  void dispose() {
  _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = _controller.getMenuItems();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              DashbordAppBar(),
              const SizedBox(
                height: 90,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                      "Dr.Khan Shab",
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23
                      )
                  )],
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: DashboardButton(
                      title: item.title,
                      img:  item.img,
                      onPressed: () => Navigator.pushNamed(context, item.route),
                    ),
                  );
                },
              )),
            ],
          ),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width / 2 -
                70, // center horizontally
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/3184611/pexels-photo-3184611.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const DashboardButton({
    Key? key,
    required this.title,
    required this.img,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        minimumSize: const Size.fromHeight(70),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(img,color: Colors.white,width: 40,height: 40,),
          Text(
            title,
            style: TextStyle(color: textColor ?? Colors.white ,fontSize: 20),
          ),
        ],
      ),
    );

  }
}
