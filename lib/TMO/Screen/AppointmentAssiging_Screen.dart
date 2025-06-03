import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orthorec/TMO/Tmo_Controller/AppointmentAssiging_controller.dart';
import 'package:orthorec/TMO/Tmo_Core/Utils/constant_Functions.dart';

class AppointmentAssigingScreen extends StatefulWidget {
  const  AppointmentAssigingScreen({super.key});

  @override
  State<AppointmentAssigingScreen> createState() => _AppointmentAssigingScreenState();
}

class _AppointmentAssigingScreenState extends State<AppointmentAssigingScreen> {
  final AppoinmentAssigning_Cont _controller = AppoinmentAssigning_Cont();

  @override
  Widget build(BuildContext context) {
    final tmo = _controller.getModelData();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Appointments_AppBar(Theme.of(context).colorScheme.primary),
              const SizedBox(height: 100),
              Text(
                tmo.Name,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildInfoCard(),
              DropdownButton(),
              SingleDateSelector(),
            ],
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 75,
              top:50,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://images.drlogy.com/assets/uploads/img/practice-profile/hospitals/profile/dant-aarogyam-seva-sadan-e50f7e6102d-36c694851ab.png"),
              ))
        ],
      ),

    );

  }

   Widget _buildInfoCard() {
     final tmo = _controller.getModelData();
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
         margin: EdgeInsets.all(4),
         padding: EdgeInsets.all(14),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(25),
             border: Border.all(color: Theme.of(context).colorScheme.primary)),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             _buildInfoRow('DOJ',  tmo.doj),
             _buildInfoRow('Gender', tmo.geder),
             _buildInfoRow('Number', tmo.Number),
             _buildInfoRow('City', tmo.City),
           ],
         ),
       ),
     );
   }
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }
}

class DropdownButton extends StatefulWidget {
  const DropdownButton({super.key});

  @override
  State<DropdownButton> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButton> {
  final List<String> Doctors = [ 'Arshad Ali',' Saad','Bacha','Khan','Arshad'];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width:double.infinity,
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                hint: const Text(
                    'Patient',
                    style: TextStyle( fontSize: 23, fontWeight: FontWeight.bold )
                ),
                items: Doctors
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 14)),
                ))
                    .toList(),
                validator: (value) =>
                value == null ? 'Please select Patient' : null,
                onChanged: (value) {},
                onSaved: (value) => selectedValue = value,
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  iconSize: 30,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SingleDateSelector extends StatefulWidget {
  const SingleDateSelector({super.key});

  @override
  State<SingleDateSelector> createState() => _SingleDateSelectorState();
}

class _SingleDateSelectorState extends State<SingleDateSelector> {
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    final DateTime today = DateTime.now();
    final DateTime oneMonthLater = DateTime(today.year, today.month + 1, today.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: oneMonthLater,
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date",style: TextStyle( fontSize: 23, fontWeight: FontWeight.w500),),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.calendar_month_outlined,size: 35,),
              onPressed: _pickDate,
            ),
          ],
        ),
      ),
    );
  }
}