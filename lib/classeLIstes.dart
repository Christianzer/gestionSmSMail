import 'package:drawer/provider/MyClasseProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClasseLists extends StatefulWidget{
  @override
  _ClasseListsState createState()=>_ClasseListsState();


}

class _ClasseListsState  extends State<ClasseLists>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MyClasseProvider>(
        create : (context) => MyClasseProvider(),
        child: Consumer<MyClasseProvider>(
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
                    DataColumn(label: Text('Code Classe'),tooltip: "Code de la classee"),
                    DataColumn(label: Text('Libelle Classe'),tooltip: "Nom de la classe")
                  ],
                  rows: provider.jsonDartdata.listesClasses.map((data) =>
                      DataRow(
                          cells: [
                            DataCell(Text(data.code)),
                            DataCell(Text(data.libelle))
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