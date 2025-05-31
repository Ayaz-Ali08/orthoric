import 'package:flutter/material.dart';
import 'package:orthorec/TMO/Tmo_Core/Utils/constant_Functions.dart';

import '../Supervisor_Controller/PatientRecord_controller.dart';

class DatewiseRecord_Screen extends StatefulWidget {
  @override
  _DatewiseRecord_ScreenState createState() => _DatewiseRecord_ScreenState();
}

class _DatewiseRecord_ScreenState extends State<DatewiseRecord_Screen> {
  final TmoPatientController controller = TmoPatientController();

  @override
  void initState() {
    super.initState();
    controller.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xff3b537f),
      //   centerTitle: true,
      //   title: const Text('Datewise Record', style: TextStyle(fontWeight: FontWeight.bold)),
      // ),
      body: Column(
        children: [
          Appointments_AppBar(Theme.of(context).colorScheme.primary),
          SizedBox(height: 20,),
          Text("Datewise Record",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // color: Theme.of(context).primaryColor,
          ),),
          SizedBox(height: 30,),
          _buildDropdown(
            label: 'TMO',
            items: controller.tmos.map((tmo) => tmo.name).toList(),
            value: controller.selectedTmo?.name,
            onChanged: (value) {
              final tmo = controller.tmos.firstWhere((t) => t.name == value);
              setState(() {
                controller.selectTMO(tmo);
              });
            },
          ),
          const SizedBox(height: 16),
          if (controller.selectedTmo != null)
            _buildDropdown(
              label: 'Patient',
              items: controller.patients.map((p) => p.name).toList(),
              value: controller.selectedPatient?.name,
              onChanged: (value) {
                final patient = controller.patients.firstWhere((p) => p.name == value);
                setState(() {
                  controller.selectPatient(patient);
                });
              },
            ),
          const SizedBox(height: 16),
          if (controller.selectedPatient != null)
            _buildDateSelector(context),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
        isExpanded: true,
        value: value,
        items: items.map((String name) {
          return DropdownMenuItem<String>(
            value: name,
            child: Text(name),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return InkWell(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: controller.selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            controller.selectDate(pickedDate);
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade200),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            Text('${controller.selectedDate.day.toString().padLeft(2, '0')}/'
                '${controller.selectedDate.month.toString().padLeft(2, '0')}/'
                '${controller.selectedDate.year}'),
            const SizedBox(width: 8),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}
