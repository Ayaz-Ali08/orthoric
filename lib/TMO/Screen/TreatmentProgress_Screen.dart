import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orthorec/TMO/Tmo_Models/Treatmentprogress_Model.dart';
import 'package:orthorec/TMO/Tmo_Controller/Treatmentprogress_Controller.dart';

import '../Tmo_Core/Utils/constant_Functions.dart';

class TreatmentProgressScreen extends StatefulWidget {
  const TreatmentProgressScreen({super.key});

  @override
  State<TreatmentProgressScreen> createState() => _TreatmentProgressScreenState();
}

class _TreatmentProgressScreenState extends State<TreatmentProgressScreen> {
  final TreatmentProgressController _controller = TreatmentProgressController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _controller.loadRecords();
    setState(() {});
  }

  Future<void> _handleAddRecord(String patientId) async {
    await _controller.addRecord(patientId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Progress recorded successfully')),
    );
    _loadData(); // Refresh the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appointments_AppBar(Theme.of(context).colorScheme.primary),
          SizedBox(height: 12,),
          Text("Treatment Progress", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Expanded(
            child: _controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _controller.records.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final record = _controller.records[index];
                return _ProgressCard(
                  record: record,
                  onRecord: () => _handleAddRecord(record.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final TreatmentProgress_mod record;
  final VoidCallback onRecord;

  const _ProgressCard({
    required this.record,
    required this.onRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.person,size: 35,color: Colors.black,),
                const SizedBox(width: 08,),
                Text(
                  record.patientName,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
               Spacer(flex: 3,),
                Text(
                  record.condition,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: onRecord,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(300),
                  backgroundColor: Color(0xff415a77),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(120, 40), // width, height
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                child: const Text('Record '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}