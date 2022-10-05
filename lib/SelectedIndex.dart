import 'package:flutter/cupertino.dart';

class SelectedIndex with ChangeNotifier {
  int selected_index = 0;
  Getselectedindex() => this.selected_index;

  Setselectedindex(int value) {
    this.selected_index = value;
    notifyListeners();
  }
}
