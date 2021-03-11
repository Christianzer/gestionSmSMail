import 'package:flutter/material.dart';
import 'package:drawer/main.dart';
import 'package:drawer/form_screen_ajouter_etudiant.dart';

 class page1 extends StatefulWidget{
@override
   _page1State createState()=>_page1State();


}

class _page1State  extends State<page1>{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Ajouter étudiant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen1(),
    );
  }
}

