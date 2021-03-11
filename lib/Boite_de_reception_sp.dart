import 'package:flutter/material.dart';
import 'package:drawer/main.dart';
import 'package:drawer/form_screen_boitedereception_sp.dart';

class page4 extends StatefulWidget{
  @override
  _page4State createState()=>_page4State();


}

class _page4State  extends State<page4>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOITE DE RECEPTION ETUDIANT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: reception_sp(),
    );
  }
}

