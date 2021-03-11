import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:drawer/models/MyMessageModel.dart';
import 'package:flutter/widgets.dart';

class MyMessageProvider extends ChangeNotifier{
  MessageJson jsonDartdata;

  Future getData(context) async{

    final String url = "http://192.168.8.107/projet_mobile_multimedia/public/api/message";
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    this.jsonDartdata = MessageJson.fromJson(resBody);
    this.notifyListeners();
    print(this.jsonDartdata);
  }
}