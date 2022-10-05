import 'package:flutter/cupertino.dart';
import 'package:geocoding/Model/StudentData.dart';

import '../main.dart';

class AbsenceData with ChangeNotifier {
  Map<int, bool> dataAbsenceL1 = {};
  Map<int, bool> dataAbsenceL2 = {};
  Map<int, bool> dataAbsenceL3 = {};
  Map<int, bool> dataAbsenceL4 = {};

  // List<bool?> absenceL1 = [];
  // List<bool?> absenceL2 = [];
  // List<bool?> absenceL3 = [];
  // List<bool?> absenceL4 = [];

  AbsenceData() {
    print(getIt<StudentData>().GetStudentL1().length);
    for (int i = 0; i < getIt<StudentData>().GetStudentL1().length; i++) {
      dataAbsenceL1.addAll({getIt<StudentData>().studentsL1[i]['id']: false});
    }
  }
  SetAbsenceDataL1(int index, bool val) {
    this.dataAbsenceL1.addAll({index: val});
    notifyListeners();
  }

  SetAbsenceDataL2(int index, bool val) {
    this.dataAbsenceL2.addAll({index: val});
    notifyListeners();
  }

  SetAbsenceDataL3(int index, bool val) {
    this.dataAbsenceL3.addAll({index: val});
    notifyListeners();
  }

  SetAbsenceDataL4(int index, bool val) {
    this.dataAbsenceL4.addAll({index: val});
    notifyListeners();
  }

  GetAbsenceDataL1() => this.dataAbsenceL1;
  GetAbsenceDataL2() => this.dataAbsenceL2;
  GetAbsenceDataL3() => this.dataAbsenceL3;
  GetAbsenceDataL4() => this.dataAbsenceL4;
}
