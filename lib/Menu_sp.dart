import 'package:drawer/ajouter_etudiant.dart';
import 'package:drawer/ajouter_classe.dart';
import 'package:drawer/envoyer_sp_classe.dart';
import 'package:drawer/item.dart';

import 'package:drawer/Boite_de_reception_sp.dart';
import 'package:drawer/envoyer_sp_etudiant.dart';
import 'package:drawer/listMessageEnvoye.dart';
import 'package:drawer/liste_classe.dart';
import 'package:drawer/liste_etudiant.dart';
import 'package:flutter/material.dart';

class drawersp extends StatefulWidget {
  drawersp({this.email, this.name});
  final String email;
  final String name;
  @override
  _drawerspState createState() => _drawerspState();
}

class _drawerspState extends State<drawersp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu sécrétaire principal'),
        ),
        drawer: Drawer(
          elevation: 2,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    child: Text('A'),
                  ),
                ),
                accountEmail: Text("${widget.email}"),
                accountName: Text("${widget.name}"),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => page2(),
                  ));
                },
                selected: true,
                title: Text('AJOUTER CLASSE'),
                leading: Icon(Icons.add_circle),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => classeListe(),
                  ));
                },
                selected: true,
                title: Text('LISTE CLASSE'),
                leading: Icon(Icons.list),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => page1(),
                  ));
                },
                selected: true,
                title: Text('AJOUTER ETUDIANT'),
                leading: Icon(Icons.add_circle),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => listeet(),
                  ));
                },
                selected: true,
                title: Text('LISTE ETUDIANTS'),
                leading: Icon(Icons.list),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => page5(),
                  ));
                },
                selected: true,
                title: Text('ENVOYER MESSAGE A UN ETUDIANT'),
                leading: Icon(Icons.message),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => page7(),
                  ));
                },
                selected: true,
                title: Text('ENVOYER MESSAGE A UNE CLASSE'),
                leading: Icon(Icons.message),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => lisMesSend(),
                  ));
                },
                selected: true,
                title: Text('LISTE DES MESSAGES ENVOYES'),
                leading: Icon(Icons.message),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => page4(),
                  ));
                },
                selected: true,
                title: Text('BOITE DE RECEPTION'),
                leading: Icon(Icons.mail),
              ),


              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Item(
                      title: ' ENVOYES',
                      icon: Icons.home,
                      color: 0xffFED525,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Item(
                      title: 'RECU',
                      icon: Icons.home,
                      color: 0xffFED525,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Item(
                      title: ' ETUDIANTS',
                      icon: Icons.home,
                      color: 0xffFED525,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Item(
                      title: 'CLASSES',
                      icon: Icons.home,
                      color: 0xffFED525,
                    ),
                  )
                ],
              )

            ],
          ),
        ),
    );
  }
}
