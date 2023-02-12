class Langue {
  String? nom;

  Langue.fromJason(Map<String,dynamic> json)
  {
    nom=json['nom'];
  }

}