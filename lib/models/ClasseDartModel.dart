class ClassJsonDart {
  int statusCode;
  List<ListesClasses> listesClasses;

  ClassJsonDart.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['listes_classes'] != null) {
      // ignore: deprecated_member_use
      listesClasses = new List<ListesClasses>();
      json['listes_classes'].forEach((v) {
        listesClasses.add(new ListesClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.listesClasses != null) {
      data['listes_classes'] =
          this.listesClasses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListesClasses {
  String code;
  String libelle;


  ListesClasses({this.code, this.libelle});

  ListesClasses.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    libelle = json['libelle'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['libelle'] = this.libelle;
    return data;
  }
}