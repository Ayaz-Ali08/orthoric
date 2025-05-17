import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:orthorec/Core/Utils/constant_Functions.dart';
import '../Reception_Controller/TmoDateAsigning_ReceptionController.dart';

class TmoAndDateAssigScreen extends StatefulWidget {

  TmoAndDateAssigScreen({super.key});

  @override
  State<TmoAndDateAssigScreen> createState() => _TmoAndDateAssigScreenState();
}

class _TmoAndDateAssigScreenState extends State<TmoAndDateAssigScreen> {
  final TmodateAssigningController _controller = TmodateAssigningController();

  @override
  Widget build(BuildContext context) {
    final patient = _controller.getmodelData();
   // final List<String> items = ["1","2","3","4 ","6","8","9","10"] ;

    return Scaffold(
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DashbordAppBar(),
            const SizedBox(height: 90),
            Text(
              patient.name,
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
          left: MediaQuery.of(context).size.width/2-75,
            top: 60,
            child: CircleAvatar(
              radius: 70,
          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-PIqzX1p7ueIQSi5p29gEtEf165sYb_DhWw&s"),
        ))
      ]),
    );
  }

  Widget _buildInfoCard() {
    final patient = _controller.getmodelData();
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
            _buildInfoRow('DOB',  patient.DOB),
            _buildInfoRow('Gender', patient.Gender),
            _buildInfoRow('Number', patient.phone),
            _buildInfoRow('City', patient.city),
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

class CustomDropdownButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CustomDropdownButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
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
  final List<String> Doctors = [ 'Dr.Arshad Ali','Dr.Saad','Dr.Bacha','Dr.Khan','Dr.Arshad'];
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
                  'TMO',
                    style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold)
                ),
                items: Doctors
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 14)),
                ))
                    .toList(),
                validator: (value) =>
                value == null ? 'Please select Doctor' : null,
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
            const Text("Date",style: TextStyle( fontSize: 23, fontWeight: FontWeight.bold),),
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
