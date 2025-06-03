
import '../Supervisor_Model/Supervisor_Dashbord_Model.dart';

class Dashbord_Controller {
  List<DashbordItem> getMenuItems() {
    return const [
      DashbordItem(
        id: '1',
        title: 'Patient Waiting Lists',
        img: "Assets/In_Line_Patient.svg",
        route: '/inlinePatient',
      ),
      DashbordItem(
        id: '2',
        title: 'Doctor Registrations',
        img: "Assets/doctor_registration.svg",
        route: '/tmoRegistration',
      ),
      DashbordItem(
        id: '3',
        title: 'Treatment Progress',
        img: "Assets/Treatment_progress.svg",
        route: '/treatmentProgress',
      ),
      DashbordItem(
        id: '4',
        title: 'Appointment Details',
        img: "Assets/Appointment_detail.svg",
        route: '/tmoList',
      ),
      DashbordItem(
        id: '5',
        title: 'Patient Records',
        img: "Assets/Datewise_record.svg",
        route: '/dateWiseRecord',
      ),
    ];
  }
}