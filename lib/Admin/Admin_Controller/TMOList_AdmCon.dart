import 'package:orthorec/Admin/Admin_Model/TMOList_Admmodel.dart';
class TMOController {
  List<TMO> getTMOList() {
    return TMO.demoList();
  }
}