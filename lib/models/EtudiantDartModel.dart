class EtudiantJson {
  int statusCode;
  Listes listes;

  EtudiantJson({this.statusCode, this.listes});

  EtudiantJson.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    listes =
    json['listes'] != null ? new Listes.fromJson(json['listes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.listes != null) {
      data['listes'] = this.listes.toJson();
    }
    return data;
  }
}

class Listes {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Listes(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Listes.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  String matricule;
  String nom;
  String prenoms;
  String contact;
  String email;
  String codecl;
  Null createdAt;
  Null updatedAt;
  EtudiantClasse etudiantClasse;
  EtudiantUtilisateur etudiantUtilisateur;

  Data(
      {this.matricule,
        this.nom,
        this.prenoms,
        this.contact,
        this.email,
        this.codecl,
        this.createdAt,
        this.updatedAt,
        this.etudiantClasse,
        this.etudiantUtilisateur});

  Data.fromJson(Map<String, dynamic> json) {
    matricule = json['matricule'];
    nom = json['nom'];
    prenoms = json['prenoms'];
    contact = json['contact'];
    email = json['email'];
    codecl = json['codecl'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    etudiantClasse = json['etudiant_classe'] != null
        ? new EtudiantClasse.fromJson(json['etudiant_classe'])
        : null;
    etudiantUtilisateur = json['etudiant_utilisateur'] != null
        ? new EtudiantUtilisateur.fromJson(json['etudiant_utilisateur'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricule'] = this.matricule;
    data['nom'] = this.nom;
    data['prenoms'] = this.prenoms;
    data['contact'] = this.contact;
    data['email'] = this.email;
    data['codecl'] = this.codecl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.etudiantClasse != null) {
      data['etudiant_classe'] = this.etudiantClasse.toJson();
    }
    if (this.etudiantUtilisateur != null) {
      data['etudiant_utilisateur'] = this.etudiantUtilisateur.toJson();
    }
    return data;
  }
}

class EtudiantClasse {
  String code;
  String libelle;
  Null createdAt;
  Null updatedAt;

  EtudiantClasse({this.code, this.libelle, this.createdAt, this.updatedAt});

  EtudiantClasse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    libelle = json['libelle'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['libelle'] = this.libelle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EtudiantUtilisateur {
  String code;
  String matricule;
  String motDePasse;
  String typeUtilisateur;
  Null createdAt;
  Null updatedAt;

  EtudiantUtilisateur(
      {this.code,
        this.matricule,
        this.motDePasse,
        this.typeUtilisateur,
        this.createdAt,
        this.updatedAt});

  EtudiantUtilisateur.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    matricule = json['matricule'];
    motDePasse = json['mot_de_passe'];
    typeUtilisateur = json['type_utilisateur'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['matricule'] = this.matricule;
    data['mot_de_passe'] = this.motDePasse;
    data['type_utilisateur'] = this.typeUtilisateur;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}