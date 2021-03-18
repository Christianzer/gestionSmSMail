import 'package:drawer/provider/MyEtudiantProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ETlistesEt extends StatefulWidget{
  @override
  _EtListesState createState()=>_EtListesState();

}

class _EtListesState  extends State<ETlistesEt>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("LISTE DES ETUDIANTS"),),
      body: ChangeNotifierProvider<MyEtudiantProvider>(
        create : (context) => MyEtudiantProvider(),
        child: Consumer<MyEtudiantProvider>(
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
                    DataColumn(label: Text('Contact'),tooltip: "Contact Etudiant"),
                    DataColumn(label: Text('Email'),tooltip: "Email Etudiant"),
                    DataColumn(label: Text('Classe'),tooltip: "Classe Etudiant"),
                    DataColumn(label: Text('Mot de passe'),tooltip: "Mot de passe Etudiant")
                  ],
                  rows: provider.jsonDartdata.listes.data.map((data) =>
                      DataRow(
                          cells: [
                            DataCell(Text(data.matricule)),
                            DataCell(Text(data.nom)),
                            DataCell(Text(data.prenoms)),
                            DataCell(Text(data.contact)),
                            DataCell(Text(data.email)),
                            DataCell(Text(data.etudiantClasse.libelle)),
                            DataCell(Text(data.etudiantUtilisateur.motDePasse))
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