import 'package:flutter/material.dart';



class MyProviderApp extends ChangeNotifier {
  String Q='';

  void search(String q) async{
    Q = q;

    notifyListeners();
  }


}