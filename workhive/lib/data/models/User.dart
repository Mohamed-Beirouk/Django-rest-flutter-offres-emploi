class User {
  int? id;
  String? nom;
  String? prenom;
  String? username;
  String? email;
  String? telephone;
  String? image;
  String? sexe;
  String? type;
  String? description;
  String? experience;
  String? adresse;
  String? skills;


  User.fromJason(Map<String,dynamic> json)
  {
    id=json['id'];
    nom=json['nom'];
    prenom=json['prenom'];
    username=json['username'];
    email=json['email'];
    telephone=json['telephone'];
    image=json['image'];
    sexe=json['sexe'];
    type=json['type'];
    description=json['description'];
    experience=json['experience'];
    adresse=json['adresse'];
    skills=json['skills'];
  }

}