import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:drawer/models/ClasseDartModel.dart';
import 'package:flutter/widgets.dart';

class MyClasseProvider extends ChangeNotifier{
  ClassJsonDart jsonDartdata;

  Future getData(context) async{
    final String url = "http://192.168.137.1/projet_mobile_multimedia/public/api/classe";
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    this.jsonDartdata = ClassJsonDart.fromJson(resBody);
    this.notifyListeners();
  }
}