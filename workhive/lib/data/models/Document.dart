class Document{
  int? id;
  String? intitule;
  String? cv;
  String? date_depot;
  int? c_emploi;


  Document.fromJason(Map<String,dynamic> json){
    id=json['id'];
    intitule=json['intitule'];
    cv=json['cv'];
    date_depot=json['date_depot'];
    c_emploi=json['c_emploi'];

  }

}