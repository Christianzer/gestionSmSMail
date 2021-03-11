import 'package:drawer/Boite_de_reception_etudiant.dart';
import 'package:drawer/Boite_de_reception_sp.dart';
import 'package:drawer/envoyer_et_sp.dart';
import 'package:drawer/envoyer_sp_classe.dart';
import 'package:drawer/envoyer_sp_etudiant.dart';
import 'package:flutter/material.dart';
import 'package:drawer/main.dart';
import 'package:flutter/widgets.dart';

class draweret extends StatefulWidget{
  draweret({this.email, this.name});
  final String email;
  final String name;
  @override
  _draweretState createState()=>_draweretState();


}

class _draweretState  extends State<draweret>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Menu Etudiant'),),

      drawer: Drawer(
        elevation: 2,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              currentAccountPicture: GestureDetector(child: CircleAvatar(child: Text('A'),),),
              accountEmail: Text("${widget.email}"),
              accountName: Text("${widget.name}"),
            ),



            ListTile(
              onTap: (){
                // showDialog(context: context,builder: (context) =>AlertDialog(content: Text('vous avez appuiyé menu1'),title: Text('status'),)

                /*)*/
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>page4(),
                ))
                ;},
              selected: true,
              title: Text('BOITE DE RECPETION'),
              leading: Icon(Icons.mail),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>pageEt(),
                ))
                ;},
              selected: true,
              title: Text('ENVOYER MESSAGE AU SP'),
              leading: Icon(Icons.message),
            ),


            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
          ],
        ),
      ),
      body: SafeArea(

      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 190,
              height: 190,
              alignment: Alignment.center
            )
          ],
        ),
        flex: 1,
      )


      ),

    );
  }
}

