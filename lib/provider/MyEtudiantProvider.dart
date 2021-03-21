import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:drawer/models/EtudiantDartModel.dart';
import 'package:flutter/widgets.dart';

class MyEtudiantProvider extends ChangeNotifier{
  EtudiantJson jsonDartdata;

  Future getData(context) async{
    final String url = "http://gestion-message.herokuapp.com/api/etudiant";
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    this.jsonDartdata = EtudiantJson.fromJson(resBody);
    this.notifyListeners();
    print(this.jsonDartdata);
  }
}