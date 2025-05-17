import 'package:flutter/material.dart';
import 'package:orthorec/Core/Utils/constant_Functions.dart';
import 'package:orthorec/patient/Patient_Model/PatientDashBard_model.dart';
import 'package:orthorec/patient/Patient_Controller/PatientDashborad_Controller.dart';

class PatientDashBoardScreen extends StatefulWidget {
  final String patientId;

  const PatientDashBoardScreen({super.key, required this.patientId});

  @override
  State<PatientDashBoardScreen> createState() => _PatientDashBoardScreenState();
}

class _PatientDashBoardScreenState extends State<PatientDashBoardScreen> {
  final PatientController _controller = PatientController();
  late PatientDashbordModel _patient;
  final TextEditingController _treatmentController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPatientData();
  }

  Future<void> _loadPatientData() async {
    setState(() => _isLoading = true);
    _patient = _controller.getPatientDetails();
    setState(() => _isLoading = false);
  }

  Future<void> _cancelAppointment() async {
    setState(() => _isLoading = true);
    try {
      await _controller.cancelAppointment(widget.patientId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Appointment cancelled successfully')),
      );
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DashbordAppBar(),
              SizedBox(
                height: 90,
              ),
              Text(
                _patient.name,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoCard(),
                            const SizedBox(height: 4),
                            _buildLastVisitCard(),
                            const SizedBox(height: 8),
                            _buildTreatmentCard(),
                            const SizedBox(height: 8),
                            _buildAppointmentCard(),
                          ],
                        ),
                      ),
              ),
            ],
          ),
          Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width / 2 - 70,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-PIqzX1p7ueIQSi5p29gEtEf165sYb_DhWw&s"),
              )),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('DOB', _patient.dob),
          _buildInfoRow('Gender', _patient.gender),
          _buildInfoRow('Number', _patient.phone),
          _buildInfoRow('City', _patient.city),
        ],
      ),
    );
  }

  Widget _buildLastVisitCard() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                "TMO",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_patient.lastVisitDate),
              Text(_patient.tmoName),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Previous Treatment",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                _patient.previousTreatment,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTreatmentCard() {
    return Padding(
      padding: const EdgeInsets.all(08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Treatment',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _treatmentController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              hintText: 'Enter treatment details',
              labelText: 'Details',
            ),
            maxLines: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Next Appointment', _patient.nextAppointment),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white),
              onPressed: _cancelAppointment,
              child: const Text('Cancel'),
            ),
          ),
        ],
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
