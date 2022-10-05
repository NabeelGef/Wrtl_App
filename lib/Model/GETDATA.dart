import 'package:geocoding/AbsencesList.dart';
import 'package:geocoding/Model/StudentData.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class GetData {
  static Future<List<List<Map>>> getdata() async {
    List<List<Map>> all_data = [];
    List<Map> studentsL1 = [],
        studentsL2 = [],
        studentsL3 = [],
        studentsL4 = [];
    Map data = {};
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? num = sharedPreferences.getInt("Index");
    if (num == null) {
      num = 0;
    }
    for (int i = 0; i < num; i++) {
      data = {
        "id": i,
        "name": sharedPreferences.getStringList("Item$i")!.elementAt(0),
        "father_name ": sharedPreferences.getStringList("Item$i")!.elementAt(1),
        "phoneNumber": sharedPreferences.getStringList("Item$i")!.elementAt(4),
        "level": sharedPreferences.getStringList("Item$i")!.elementAt(6),
        "location": sharedPreferences.getStringList("Item$i")!.elementAt(2),
        "birthdate": sharedPreferences.getStringList("Item$i")!.elementAt(3),
        "study_state": sharedPreferences.getStringList("Item$i")!.elementAt(5),
        "attendance": sharedPreferences.getStringList("Item$i")!.elementAt(7),
        "absence": sharedPreferences.getStringList("Item$i")!.elementAt(8)
      };
      if (int.parse(sharedPreferences.getStringList("Item$i")!.elementAt(6)) ==
          1) {
        studentsL1.add(data);
      } else if (int.parse(
              sharedPreferences.getStringList("Item$i")!.elementAt(6)) ==
          2) {
        studentsL2.add(data);
      } else if (int.parse(
              sharedPreferences.getStringList("Item$i")!.elementAt(6)) ==
          3) {
        studentsL3.add(data);
      } else {
        studentsL4.add(data);
      }
    }
    all_data.add(studentsL1);
    all_data.add(studentsL2);
    all_data.add(studentsL3);
    all_data.add(studentsL4);

    getIt<StudentData>().SetStudentL1(studentsL1);
    getIt<StudentData>().SetStudentL2(studentsL2);
    getIt<StudentData>().SetStudentL3(studentsL3);
    getIt<StudentData>().SetStudentL4(studentsL4);

    return all_data;
  }

  static Future<List<String>> getStudentById(var i) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> data = [
      sharedPreferences.getStringList("Item$i")!.elementAt(0),
      sharedPreferences.getStringList("Item$i")!.elementAt(1),
      sharedPreferences.getStringList("Item$i")!.elementAt(2),
      sharedPreferences.getStringList("Item$i")!.elementAt(3),
      sharedPreferences.getStringList("Item$i")!.elementAt(4),
      sharedPreferences.getStringList("Item$i")!.elementAt(5),
      sharedPreferences.getStringList("Item$i")!.elementAt(6),
      sharedPreferences.getStringList("Item$i")!.elementAt(7),
      sharedPreferences.getStringList("Item$i")!.elementAt(8)
    ];

    return data;
  }
}
