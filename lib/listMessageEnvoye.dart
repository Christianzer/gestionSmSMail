import 'package:drawer/etudiantListes.dart';
import 'package:drawer/messageSend.dart';
import 'package:flutter/material.dart';

class lisMesSend extends StatefulWidget{
  @override
  _listMessSendState createState()=>_listMessSendState();
}

class _listMessSendState  extends State<lisMesSend>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LISTES ETUDIANTS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (MessaGeEt()),
    );
  }
}