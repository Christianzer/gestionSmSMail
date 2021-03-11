import 'package:flutter/material.dart';
import 'package:drawer/main.dart';
import 'package:drawer/form_screen_envoyer_sp_classe.dart';

class page7 extends StatefulWidget{
  @override
  _page7State createState()=>_page7State();


}

class _page7State  extends State<page7>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ENVOYER MESSAGE A UNE CLASSE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen7(),
    );
  }
}

