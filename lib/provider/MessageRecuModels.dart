import 'dart:convert';
import 'package:drawer/models/MessageRecusModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyMessageRecuProvider extends ChangeNotifier{
  MessageRecuJson jsonDartdata;

  Future getData(context) async{
    final prefs = await SharedPreferences.getInstance();
    final matricule = prefs.getString('matricule');
    final String url = "http://192.168.137.1/projet_mobile_multimedia/public/api/messageSp/$matricule";
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    this.jsonDartdata =  MessageRecuJson.fromJson(resBody);
    this.notifyListeners();
  }
}