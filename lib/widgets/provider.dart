import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController txtCity = TextEditingController();
  String? city;

  void search() {
    city = txtCity.text;
    notifyListeners();
  }
}