import 'package:flutter/cupertino.dart';

class GroupStatues with ChangeNotifier {
  String? groupStatues;

  SetGroupStatues(String val) {
    this.groupStatues = val;
    notifyListeners();
  }
}
