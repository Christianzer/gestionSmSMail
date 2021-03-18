import 'package:drawer/provider/MessageRecuModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class reception_sp extends StatefulWidget{
  @override
  _reception_spState createState()=>_reception_spState();


}

class _reception_spState  extends State<reception_sp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("BOITE DE RECEPTION"),),
      body: ChangeNotifierProvider<MyMessageRecuProvider>(
        create : (context) => MyMessageRecuProvider(),
        child: Consumer<MyMessageRecuProvider>(
          builder: (context,provider,child){
            if(provider.jsonDartdata == null){
              provider.getData(context);
              return Center(child: LinearProgressIndicator());
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Objet'),tooltip: "Objet Message"),
                    DataColumn(label: Text('Message'),tooltip: "Message"),
                  ],
                  rows: provider.jsonDartdata.listes.map((data) =>
                      DataRow(
                          cells: [
                            DataCell(Text(data.objet)),
                            DataCell(Text(data.message)),
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