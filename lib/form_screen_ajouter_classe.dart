import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sweetalert/sweetalert.dart';
TextEditingController code = new TextEditingController();
TextEditingController libe = new TextEditingController();


class FormScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreen2State();
  }
}


class FormScreen2State extends State<FormScreen2> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildcodecl() {
    return TextFormField(
      controller: code,
      decoration: InputDecoration(labelText: 'Code classe'),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Code requis';
        }
        return null;
      },
    );
  }

  Widget _buildlibel() {
    return TextFormField(
      controller: libe,
      decoration: InputDecoration(labelText: 'Libelle classe'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Libelle requis';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void saisieClasse(String codecl,String lib) async{
      var url = 'http://192.168.137.1/projet_mobile_multimedia/public/api/classe';
      //var url = 'http://projet_mobile_multimedia.test/api/classe';
      Map<String, String> headers = {'Content-Type':'application/json'};
      String body = '{"code":"$codecl","libelle":"$lib"}';
      Response response = await http.post(url,headers: headers,body:body);
      var resBody = json.decode(response.body);
      print(resBody);
      if (resBody['status_code'] == 200) {
        SweetAlert.show(context,subtitle: "Enregistrement......", style: SweetAlertStyle.loading);
        new Future.delayed(new Duration(seconds: 5),(){
          code.clear();
          libe.clear();
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
      appBar: AppBar(title: Text("AJOUTER CLASSE")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildcodecl(),
                _buildlibel(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    saisieClasse(code.text,libe.text);




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