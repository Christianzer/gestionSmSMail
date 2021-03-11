import 'package:flutter/material.dart';
import 'package:drawer/main.dart';
import 'package:drawer/form_screen_ajouter_classe.dart';


class page2 extends StatefulWidget{
  @override
  _page2State createState()=>_page2State();


}

class _page2State  extends State<page2>{
  String _codcl;
  String _libel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AJOUTER CLASSE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen2(),
    );
  }
}

