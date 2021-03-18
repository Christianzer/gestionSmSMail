import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:flutter/material.dart';

TextEditingController _obj = new TextEditingController();
TextEditingController _mess = new TextEditingController();
class FormScreen5 extends StatefulWidget {
  String get title => null;
  @override
  State<StatefulWidget> createState() {
    return FormScreen5State();
  }
}

class FormScreen5State extends State<FormScreen5> {

  String _nomet;
  // ignore: deprecated_member_use
  List typmess= [{"id":1,"libelle":'Email'},{"id":2,"libelle":'Sms'}];
  String valueChooseEt;
  String valueChooseType;
  // ignore: deprecated_member_use
  List testdata = List();
  final String url = "http://projet_mobile_multimedia.test/api/etudiant";
  Future<String> getSWData() async {
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    setState(() {
      testdata = resBody['listes']['data'];
    });
    return "Sucess";
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  Widget _buildetudiant() {
    return  Container(
      //padding: EdgeInsets.only(left: 16, right: 16),

      child: DropdownButton(
        hint: Text('Choisir etudiant'),
        dropdownColor: Colors.grey,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        style: TextStyle(
            color: Colors.black,
            fontSize: 14
        ),
        items: testdata.map((valueItem){
          return DropdownMenuItem(
            value: valueItem['matricule'].toString(),
            child: Text(valueItem['nom']+' '+valueItem['prenoms']),
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            valueChooseEt = newVal;
          });
        },
        value: valueChooseEt,
      ),
    );
  }


  Widget _buildtypmess() {
    return  Container(
      //padding: EdgeInsets.only(left: 16, right: 16),
      child: DropdownButton(
        hint: Text('Choisir type de message'),
        dropdownColor: Colors.grey,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        style: TextStyle(
            color: Colors.black,
            fontSize: 14
        ),
        value: valueChooseType,
        onChanged: (newValue){
          setState(() {
            valueChooseType=newValue;
          });
        },
        items: typmess.map((valueItem){
          return DropdownMenuItem(
            value: valueItem['id'].toString(),
            child: Text(valueItem['libelle']),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildobj() {
    return TextFormField(
      controller: _obj,
      decoration: InputDecoration(labelText: 'Objet message'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Objet requis';
        }

        return null;
      },
    );
  }

  Widget _buildmess() {
    return TextFormField(
      controller: _mess,
      decoration: InputDecoration(hintText: 'Message',border: OutlineInputBorder() ),
      maxLines: 5,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Message requis';
        }

        return null;
      },
    );
  }


  @override
  void initState() {
    super.initState();
    this.getSWData();
  }


  @override
  Widget build(BuildContext context) {
    Future<void> envoyerMessage(String matriculeEt,String typeMessage, String objetMess , String Message) async {
      var url = 'http://192.168.137.1/projet_mobile_multimedia/public/api/message';
      int elemt = 1;
      int type = int.parse(typeMessage);
      Map<String, String> headers = {'Content-Type':'application/json'};
      String body = '{"matricule":$matriculeEt,"type_message":$type,"objet":$objetMess,"message":$Message,"element":$elemt}';
      print(body);
      Response response = await http.post(url,headers: headers,body:body);
      print(response);
      var resBody = json.decode(response.body);
      print(resBody);
      if (resBody['status_code'] == 200) {
        SweetAlert.show(context,subtitle: "Envoie......", style: SweetAlertStyle.loading);
        new Future.delayed(new Duration(seconds: 10),(){
          _obj.clear();
          _mess.clear();
          SweetAlert.show(context,subtitle: "Success!", style: SweetAlertStyle.success);
        });
      }else{
        SweetAlert.show(context,
            title: "Information",
            subtitle: "Erreur lors de l'insertion",
            style: SweetAlertStyle.error);
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text("ENVOYER MESSAGE")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildetudiant(),
                SizedBox(height: 30,),
                _buildtypmess(),
                SizedBox(height: 30,),
                _buildobj(),
                SizedBox(height: 30,),
                _buildmess(),

                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Envoyer',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
                    envoyerMessage(valueChooseEt,valueChooseType,_obj.text,_mess.text);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}