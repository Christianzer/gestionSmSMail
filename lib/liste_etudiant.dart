import 'package:drawer/etudiantListes.dart';
import 'package:flutter/material.dart';

class listeet extends StatefulWidget{
  @override
  _listeetState createState()=>_listeetState();
}

class _listeetState  extends State<listeet>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LISTES ETUDIANTS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (ETlistesEt()),
    );
  }
}