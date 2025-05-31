import '../../Tmo_Models/Patient/TableModel.dart';

class CephalometricController {
  List<CephalometricData> getData() {
    return [
      CephalometricData(variable: 'SNA', normal: '82\u00B0 ± 2', preTreatment: ''),
      CephalometricData(variable: 'SNB', normal: '80\u00B0 ± 2', preTreatment: ''),
      CephalometricData(variable: 'ANB', normal: '0\u00B0 ± 4', preTreatment: ''),
      CephalometricData(variable: 'Wits appraisal', normal: '\u03B41, \u03A9 mm', preTreatment: ''),
      CephalometricData(variable: 'SN to maxillary plane', normal: '6\u00B0 ± 4', preTreatment: ''),
      CephalometricData(variable: 'SN Mandibular Plane', normal: '32\u00B0 ± 4', preTreatment: ''),
      CephalometricData(variable: 'Maxillary mandibular planes angle', normal: '25\u00B0 ± 4', preTreatment: ''),
      CephalometricData(variable: 'FH Mandibular Plane', normal: '26\u00B0 ± 4', preTreatment: ''),
      CephalometricData(variable: 'Face height ratio (Lower to total face height)', normal: '54% ± 4', preTreatment: ''),
      CephalometricData(variable: 'Jaraback Ratio', normal: '65% ± 4', preTreatment: ''),
      CephalometricData(variable: 'Upper incisor to SN plane angle', normal: '102\u00B0 ± 5', preTreatment: ''),
      CephalometricData(variable: 'Upper incisor to maxillary plane angle', normal: '108\u00B0 ± 5', preTreatment: ''),
      CephalometricData(variable: 'Lower incisor to mandibular plane angle', normal: '90\u00B0 ± 5', preTreatment: ''),
      CephalometricData(variable: 'Interincisal angle', normal: '135\u00B0 ± 5', preTreatment: ''),
      CephalometricData(variable: 'Lower incisor to APog line', normal: '0mm', preTreatment: ''),
      CephalometricData(variable: 'Upper lip to Ricketts E Plane', normal: '-3 ± 2 mm', preTreatment: ''),
      CephalometricData(variable: 'Lower lip to Ricketts E Plane', normal: '-2 ± 2 mm', preTreatment: ''),
      CephalometricData(variable: 'Nasiolabial angle*', normal: '102\u00B0 ± 8', preTreatment: ''),
    ];
  }
}