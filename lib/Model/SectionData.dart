import 'package:flutter/cupertino.dart';

class SectionData with ChangeNotifier {
  var sections = ["1", "2", "3", "4"];
  String Item = "1";
  SetItem(String data) {
    this.Item = data;
    notifyListeners();
  }
}
