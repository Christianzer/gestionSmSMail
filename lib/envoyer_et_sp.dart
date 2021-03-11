import 'package:drawer/form_screen__etuidant_sp.dart';
import 'package:drawer/form_screen__sp_etudiant.dart';
import 'package:flutter/material.dart';
import 'package:drawer/main.dart';

class pageEt extends StatefulWidget{
  @override
  _pageEtState createState()=>_pageEtState();

}

class _pageEtState  extends State<pageEt>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ENVOYER MESSAGE A UN SP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreenEtSp(),
    );
  }
}

