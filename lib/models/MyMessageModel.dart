class MessageJson {
  int statusCode;
  List<Listes> listes;

  MessageJson({this.statusCode, this.listes});

  MessageJson.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['listes'] != null) {
      listes = new List<Listes>();
      json['listes'].forEach((v) {
        listes.add(new Listes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.listes != null) {
      data['listes'] = this.listes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listes {
  int id;
  String objet;
  String message;
  String matricule;
  int typeMessage;
  Null createdAt;
  Null updatedAt;
  String nom;
  String prenoms;
  String contact;
  String email;
  String codecl;

  Listes(
      {this.id,
        this.objet,
        this.message,
        this.matricule,
        this.typeMessage,
        this.createdAt,
        this.updatedAt,
        this.nom,
        this.prenoms,
        this.contact,
        this.email,
        this.codecl});

  Listes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objet = json['objet'];
    message = json['message'];
    matricule = json['matricule'];
    typeMessage = json['type_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nom = json['nom'];
    prenoms = json['prenoms'];
    contact = json['contact'];
    email = json['email'];
    codecl = json['codecl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['objet'] = this.objet;
    data['message'] = this.message;
    data['matricule'] = this.matricule;
    data['type_message'] = this.typeMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['nom'] = this.nom;
    data['prenoms'] = this.prenoms;
    data['contact'] = this.contact;
    data['email'] = this.email;
    data['codecl'] = this.codecl;
    return data;
  }
}