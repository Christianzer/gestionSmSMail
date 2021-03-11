import 'package:flutter/material.dart';

class reception_etudiant extends StatefulWidget{
  @override
  _reception_etudiantState createState()=>_reception_etudiantState();


}

class _reception_etudiantState  extends State<reception_etudiant>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("BOITE DE RECPTION ")),
      body: Container(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Nom etudiant')),
            DataColumn(label: Text('Type message')),
            DataColumn(label: Text('objet')),
            DataColumn(label: Text('Message')),


          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('zizer')),
              DataCell(Text('sms')),
              DataCell(Text('discipline')),
              DataCell(Text('monsieur')),


            ]),

            DataRow(cells: [
              DataCell(Text('koissi ')),
              DataCell(Text('email')),
              DataCell(Text('Moyennes')),
              DataCell(Text('ok')),


            ]),


          ],
        ),
      ),
    );
  }
}