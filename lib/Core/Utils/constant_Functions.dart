import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DashbordAppBar extends StatelessWidget {
  const DashbordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          // Logout button at top-right
          Positioned(
            top: 30,
            left: MediaQuery.of(context).size.width / 1.1 - 15,
            child: IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          // Optional title or other decoration can be added here
          // const Positioned(
          //   bottom: 16,
          //   left: 16,
          //   child: Text(
          //     'Dashboard',
          //     style: TextStyle(
          //       fontSize: 22,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}


 // data Registration Field For DOB and DOJ
class DobPickerField extends StatefulWidget {
  final String label;
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const DobPickerField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  @override
  _DobPickerFieldState createState() => _DobPickerFieldState();
}

class _DobPickerFieldState extends State<DobPickerField> {
  String? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialValue ?? "";
  }

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      String formatted = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        selectedDate = formatted;
      });
      widget.onChanged(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xffd9d9d9),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate?.isEmpty ?? true ? widget.label : selectedDate!,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.calendar_month_outlined),
          ],
        ),
      ),
    );
  }
}
 // Dataa registration Gender Drop Down
Widget buildDropdown(
    String label, List<String> items, Function(String?) onChanged) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xffd9d9d9),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        hint: Text(label),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: (value) => value == null ? 'Please select $label' : null,
        onChanged: onChanged,
      ),
    ),
  );
}
 // Data Registration TextFIeld
Widget buildTextField(String label, Function(String) onSaved) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xffd9d9d9), borderRadius: BorderRadius.circular(50)),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: label,
          border: InputBorder.none,
        ),
        validator: (value) =>
        value?.isEmpty ?? true ? 'Required field' : null,
        onSaved: (value) => onSaved(value ?? ''),
      ),
    ),
  );
}
