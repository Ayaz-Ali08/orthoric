
import '../Supervisor_Model/Supervisor_Dashbord_Model.dart';

class Dashbord_Controller {
  List<DashbordItem> getMenuItems() {
    return const [
      DashbordItem(
        id: '1',
        title: 'Patient Waiting List',
        img: "Assets/In_Line_Patient.svg",
        route: '/inlinePatient',
      ),
      DashbordItem(
        id: '2',
        title: 'Doctor Registration',
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
        title: 'Appointment Detail',
        img: "Assets/Appointment_detail.svg",
        route: '/tmoList',
      ),
      DashbordItem(
        id: '5',
        title: 'Patient Record',
        img: "Assets/Datewise_record.svg",
        route: '/dateWiseRecord',
      ),
    ];
  }
}