import 'package:drawer/form_screen__sp_etudiant.dart';
import 'package:flutter/material.dart';
import 'package:drawer/main.dart';

class page5 extends StatefulWidget{
  @override
  _page5State createState()=>_page5State();

}

class _page5State  extends State<page5>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ENVOYER MESSAGE A UN ETUDIANT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen5(),
    );
  }
}

