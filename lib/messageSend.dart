import 'package:drawer/provider/MyMessageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessaGeEt extends StatefulWidget{
  @override
  _EtMessageState createState()=>_EtMessageState();


}

class _EtMessageState  extends State<MessaGeEt>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("LISTE DES MESSAGES ENVOYES"),),
      body: ChangeNotifierProvider<MyMessageProvider>(
        create : (context) => MyMessageProvider(),
        child: Consumer<MyMessageProvider>(
          builder: (context,provider,child){
            if(provider.jsonDartdata == null){
              provider.getData(context);
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Matricule'),tooltip: "Matricule Etudiant"),
                    DataColumn(label: Text('Nom'),tooltip: "Nom Etudiant"),
                    DataColumn(label: Text('Prenoms'),tooltip: "Prenoms Etudiant"),
                    DataColumn(label: Text('Classe'),tooltip: "Classe Etudiant"),
                    DataColumn(label: Text('Objet'),tooltip: "Objet Message"),
                    DataColumn(label: Text('Message'),tooltip: "Message")
                  ],
                  rows: provider.jsonDartdata.listes.map((data) =>
                      DataRow(
                          cells: [
                            DataCell(Text(data.matricule)),
                            DataCell(Text(data.nom)),
                            DataCell(Text(data.prenoms)),
                            DataCell(Text(data.codecl)),
                            DataCell(Text(data.objet)),
                            DataCell(Text(data.message))
                          ]
                      )
                  ).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}