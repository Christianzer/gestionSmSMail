import 'package:drawer/Menu_sp.dart';
import 'package:drawer/ajouter_etudiant.dart';
import 'package:drawer/ajouter_classe.dart';
import 'dart:convert';
import 'package:drawer/Boite_de_reception_sp.dart';
import 'package:drawer/envoyer_sp_etudiant.dart';
import 'package:flutter/material.dart';
import 'package:drawer/Animation/FadeAnimation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';

import 'Menu_etudiant.dart';

void main() {
  runApp(MyApp());
}

String name = '';
String email='';
String matricule='';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GESTION DES MESSAGES ETUDIANT-SP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
        routes: <String,WidgetBuilder>{
          '/spadmin':(BuildContext context) => new drawersp(email:email,name: name),
          '/etudiantadmin':(BuildContext context) => new draweret(email:email,name:name),
        }
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController mdpController = new TextEditingController();
    Future<List> connect (String login, String mdp) async{
      var url = 'http://192.168.8.107/projet_mobile_multimedia/public/api/login';
      //var url = 'http://projet_mobile_multimedia.test/api/login';
      Map<String, String> headers = {'Content-Type':'application/json'};
      String body = '{"email":"$login","pass":"$mdp"}';
      Response response = await http.post(url,headers: headers,body:body);
      int statusCode = response.statusCode;
      print(statusCode);
      if (statusCode == 200) {
        var rep = json.decode(response.body);
        int type = int.parse(rep[0]["type_utilisateur"]);
        print(type);
        final prefs = await SharedPreferences.getInstance();
        if(type == 2){
          Navigator.pushReplacementNamed(context, '/spadmin');
          setState(() {
            name= rep[0]["nom"]+" "+rep[0]["prenoms"];
            email = rep[0]["email"];
            matricule = rep[0]["matricule"];
            // obtain shared preferences
            prefs.setString('matricule', matricule);
          });
        }else if(type == 1){
          Navigator.pushReplacementNamed(context, '/etudiantadmin');
          setState(() {
            name= rep[0]["nom"]+" "+rep[0]["prenoms"];
            email = rep[0]["email"];
            matricule = rep[0]["matricule"];
            // obtain shared preferences
            prefs.setString('matricule', matricule);
          });
        }
      } else {
        SweetAlert.show(context,
            title: "Identifiant ou Mot de passe Errone",
            style: SweetAlertStyle.error);
      }
    }
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,

                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(

                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(

                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(

                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(

                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Matricule",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: true,
                                controller: mdpController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: () {
                          connect(emailController.text,mdpController.text);
                        },
                        child: FadeAnimation(2, Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(
                                        81, 134, 239, 0.9803921568627451),
                                    Color.fromRGBO(9, 55, 226, 0.6),
                                  ]
                              )
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      ),
                      SizedBox(height: 70,),
                      // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
