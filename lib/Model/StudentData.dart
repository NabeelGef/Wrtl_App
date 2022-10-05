import 'package:flutter/cupertino.dart';

class StudentData with ChangeNotifier {
  List<Map> studentsL1 = [];
  List<Map> studentsL2 = [];
  List<Map> studentsL3 = [];
  List<Map> studentsL4 = [];

  SetStudentL1(List<Map> newData) {
    studentsL1 = newData;
  }

  SetStudentL2(List<Map> newData) {
    studentsL2 = newData;
  }

  SetStudentL3(List<Map> newData) {
    studentsL3 = newData;
  }

  SetStudentL4(List<Map> newData) {
    studentsL4 = newData;
  }

  GetStudentL1() => this.studentsL1;
  GetStudentL2() => this.studentsL2;
  GetStudentL3() => this.studentsL3;
  GetStudentL4() => this.studentsL4;
}
