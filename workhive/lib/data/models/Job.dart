class Job{
  String? entreprise;
  String? titre;
  String? adresse;
  String? date;
  String? link;
  String? image;


  Job.fromJason(Map<String,dynamic> json){
    entreprise=json['entreprise'];
    titre=json['titre'];
    adresse=json['adresse'];
    date=json['date'];
    link=json['link'];
    image=json['image'];

  }

}