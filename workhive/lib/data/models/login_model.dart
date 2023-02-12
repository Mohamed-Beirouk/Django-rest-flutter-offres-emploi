

import 'User.dart';
import 'lang.dart';

class LoginModel {
  String? token;
  String? refresh_token;
  String? message;
  User? user;
  String? lang;
  List<Langue>? languages;

  LoginModel.fromJason(Map<String,dynamic> json)
  {
    token = json['token'];
    refresh_token=json['refresh_token'];
    message=json['message'];
    user=User.fromJason(json['user']);
    lang=json['lang'];
  }
}







