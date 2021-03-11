import 'package:drawer/classeLIstes.dart';
import 'package:drawer/liste_classe.dart';
import 'package:flutter/material.dart';
import 'package:drawer/main.dart';


class classeListe extends StatefulWidget{
  @override
  _classeListeState createState()=>_classeListeState();


}

class _classeListeState  extends State<classeListe>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LISTES CLASSES',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (ClasseLists()),
    );
  }
}

