import 'package:flutter/material.dart';
import '../../Tmo_Controller/Patient/TableController.dart';
import 'Patientrecord_3scren.dart';

class CephalometricAnalysisTable extends StatefulWidget {
  @override
  _CephalometricAnalysisTableState createState() => _CephalometricAnalysisTableState();
}

class _CephalometricAnalysisTableState extends State<CephalometricAnalysisTable> {
  final CephalometricController controller = CephalometricController();
  late List<TextEditingController> _preTreatmentControllers;
  final ScrollController _scrollController = ScrollController();
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    final data = controller.getData();
    _preTreatmentControllers = data
        .map((item) => TextEditingController(text: item.preTreatment))
        .toList();

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() => _showButton = true);
      }
    });
  }


  @override
  void dispose() {
    for (var controller in _preTreatmentControllers) {
      controller.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final data = controller.getData();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '  PRE-TREATMENT CEPHALOMETRIC \n   ANALYSIS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Table(
                      border: TableBorder.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(1.8),
                        1: FlexColumnWidth(1.3),
                        2: FlexColumnWidth(1.2),
                      },
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(color: Colors.white),
                          children: [
                            _buildHeaderCell('Variables', Colors.blue),
                            _buildHeaderCell('Normal', Colors.blue),
                            _buildHeaderCell('Pre-Treatment', Colors.blue),
                          ],
                        ),
                        ...List.generate(data.length, (index) {
                          final item = data[index];
                          return TableRow(
                            decoration: const BoxDecoration(color: Colors.white),
                            children: [
                              _buildDataCell(item.variable, Colors.blue),
                              _buildDataCell(item.normal, Colors.black),
                              _buildEditableCell(_preTreatmentControllers[index]),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              // Save button
              Visibility(
                visible: _showButton,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      RoundIconButton(
                        Icons.arrow_back_ios_new_outlined,
                            () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width:60,),
                      ElevatedButton(
                        onPressed: _saveData,
                        child: const Text('Save Changes'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: textColor,
          fontWeight: textColor == Colors.blue ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildEditableCell(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none, // Remove border
          contentPadding: EdgeInsets.all(8),
        ),
      ),
    );
  }

  void _saveData() {
    // Here you would typically save the data to your database or state management
    // For now, we'll just print the values to console
    for (int i = 0; i < _preTreatmentControllers.length; i++) {
      print('${controller.getData()[i].variable}: ${_preTreatmentControllers[i].text}');
    }

    // Show confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pre-treatment data saved successfully'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}