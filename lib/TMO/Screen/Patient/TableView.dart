import 'package:flutter/material.dart';
import '../../Tmo_Controller/Patient/TableController.dart';

class CephalometricAnalysisTable extends StatelessWidget {
  final CephalometricController controller = CephalometricController();

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
              // Wrap table in Expanded to make it scrollable
              Expanded(
                child: SingleChildScrollView(
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
                        ...data.map((item) => TableRow(
                          decoration: const BoxDecoration(color: Colors.white),
                          children: [
                            _buildDataCell(item.variable, Colors.blue),
                            _buildDataCell(item.normal, Colors.black),
                            _buildDataCell(item.preTreatment, Colors.black),
                          ],
                        )).toList(),
                      ],
                    ),
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
}