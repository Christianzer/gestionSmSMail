import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sweetalert/sweetalert.dart';
TextEditingController _matricule = new TextEditingController();
TextEditingController _nom = new TextEditingController();
TextEditingController _prenom = new TextEditingController();
TextEditingController _tel = new TextEditingController();
TextEditingController _mail = new TextEditingController();
TextEditingController _mdp = new TextEditingController();


class FormScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreen1State();
  }
}

class FormScreen1State extends State<FormScreen1> {
  String _mySelection;
  // ignore: deprecated_member_use
  List testdata = List();
  final String url = "http://192.168.8.107/projet_mobile_multimedia/public/api/classe";
  Future<String> getSWData() async {
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    setState(() {
      testdata = resBody['listes_classes'];
    });
    return "Sucess";
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      controller: _nom,
      decoration: InputDecoration(labelText: 'Nom'),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Nom requis';
        }

        return null;
      },
    );
  }

  Widget _buildClasse() {
    return  Container(
        child: new DropdownButton(
          hint: Text('Choisir la classe'),
          dropdownColor: Colors.grey,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12
          ),
          items: testdata.map((valueItem){
            return DropdownMenuItem(
              value: valueItem['code'].toString(),
              child: Text(valueItem['libelle']),
            );
          }).toList(),
          onChanged: (newVal) {
            setState(() {
              _mySelection = newVal;
            });
          },
          value: _mySelection,

        )
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: _mail,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Email requis';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Svp entrer un email valide';
        }

        return null;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _mdp,
      decoration: InputDecoration(labelText: 'Mot de Passe'),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Mot de passe requis';
        }

        return null;
      },
    );
  }

  Widget _builprenom() {
    return TextFormField(
      controller: _prenom,
      decoration: InputDecoration(labelText: 'Prénom'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Prénom requis';
        }

        return null;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: _tel,
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Numero de telephone requis';
        }

        return null;
      },
    );
  }

  Widget _buildmatricule() {
    return TextFormField(
      controller: _matricule,
      decoration: InputDecoration(labelText: 'Matricule'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Matricule requis';
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
    void saisieEt(String matricule,String nom,String prenosm,String contatc,String email,String codecl,String mdp) async{
      var url = 'http://192.168.8.107/projet_mobile_multimedia/public/api/etudiant';
      Map<String, String> headers = {'Content-Type':'application/json'};
      String body = '{"matricule":"$matricule","nom":"$nom","prenoms":"$prenosm","contact":"$contatc","email":"$email","codecl":"$codecl","mot_de_passe":"$mdp"}';
      print(body);
      Response response = await http.post(url,headers: headers,body:body);
      print(response);
      var resBody = json.decode(response.body);
      print(resBody);
      if (resBody['status_code'] == 200) {
        SweetAlert.show(context,subtitle: "Enregistrement......", style: SweetAlertStyle.loading);
        new Future.delayed(new Duration(seconds: 5),(){
          _matricule.clear();
          _nom.clear();
          _prenom.clear();
          _tel.clear();
          _mail.clear();
          _mdp.clear();
          SweetAlert.show(context,subtitle: "Success!", style: SweetAlertStyle.success);
        });
      }
      else{
        SweetAlert.show(context,
            title: "Information",
            subtitle: "Erreur lors de l'insertion",
            style: SweetAlertStyle.error);
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text("AJOUTER ETUDIANT")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildmatricule(),
                _buildClasse(),
                _buildName(),
                _builprenom(),
                _buildEmail(),
                _buildPhoneNumber(),
                _buildPassword(),
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
                    saisieEt(_matricule.text, _nom.text, _prenom.text, _tel.text, _mail.text, _mySelection,_mdp.text);
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