class RegisterManager
{
  UserModel? user;
  String? token;
  String? refresh_token;
  RegisterManager.fromJason(Map<String,dynamic> json)
  {
    user=json['user']!= null ? UserModel.fromJason(json['user']) : null;
    token=json['token'];
    refresh_token=json['refresh_token'];
  }
}

class UserModel{
  String? phone;
  String? role;
  UserModel.fromJason(Map<String,dynamic>json){
    phone=json['phone'];
    role=json['role'];
  }
}