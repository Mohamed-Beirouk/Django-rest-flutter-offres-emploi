import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workHive/cubit/LoginStates.dart';
import '../../../../data/dataprovider/network_services.dart';
import '../../../../data/models/login_model.dart';
import '../presentations/cryptageBeirouk/cryptagefunctions.dart';

class LoginCubit extends Cubit<LoginStates>
{
  NetworkService networkService = new NetworkService();
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  Future<void> userLogin({
    required String phone,
    required String password,
  })
  async {
    emit(LoginLoadingState());

    networkService.login(phone, password).then((value) async {

      if(value?.statusCode==200){
        final prefs = await SharedPreferences.getInstance();
        String key = jsonDecode(value!.body.toString())['key'];
        String encryptedData = jsonDecode(value.body.toString())['data'];
        Encrypt.decryptAES(encryptedData, key).then((datump){
          loginModel = LoginModel.fromJason(jsonDecode(datump));
          prefs.setString('token', loginModel!.token ?? '');
          print(loginModel!.user!.nom);
        }).then((value) {
          emit(LoginSuccessState(loginModel!));
        });

        // List<dynamic> data = jsonDecode(value.body.toString())['langues'];
        // List<Langue> listLangues = [];
        // if (data != null) {
        //   listLangues = data.map((item) => Langue.fromJason(item)).toList();
        // }
        // loginModel!.languages=listLangues;

        // emit(LoginSuccessState(loginModel!));
      }
      else if (value!.statusCode==401){
        emit(LoginErrorState(jsonDecode(value.body.toString())['message']));
      }
      else{
        emit(LoginErrorState('chi kbir 500'));
      }
    }).catchError((error){
      print(error.toString());
      // if(error.response.statusCode == 400){
      //   if(error.response.toString().length<40){
      //     print(error.response);
      //     print(error.response.toString().length);
      //     emit(LoginErrorState("Donnes invalide,"));
      //   }
      //   else{
      //     emit(LoginErrorState("Compte blockée."));
      //     print(error.response);
      //     print(error.response.toString().length);
      //   }
      // }
      // else{
      //   print(error.response);
      //   emit(LoginErrorState("Erreur inconnue, essayer plus tard."));
      // }
    });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined :Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}


