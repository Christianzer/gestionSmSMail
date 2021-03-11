import 'package:flutter/material.dart';
import 'package:drawer/main.dart';
import 'package:drawer/form_screen_boiterecption-et.dart';

class page6 extends StatefulWidget{
  @override
  _page6State createState()=>_page6State();


}

class _page6State  extends State<page6>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOITE DE RECEPTION ETUDIANT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: reception_etudiant(),
    );
  }
}

