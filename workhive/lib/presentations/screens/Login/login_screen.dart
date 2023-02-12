import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pinput/pinput.dart';
import 'package:workHive/cubit/LoginCubit.dart';
import 'package:workHive/cubit/LoginStates.dart';
import '../../../size_config.dart';
import '../../components/default_button.dart';
import '../../components/text_form_field.dart';
import '../../constants/constants.dart';
import '../../constants/strings.dart';
import 'package:http/http.dart' as http;



class Login extends StatefulWidget {
  LocalStorage localStorageLogin =new LocalStorage('storage');
  Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? filledColor = false;
  bool? lgoinerror=false;
  bool? isLoading = true;
  bool isPassword = true;
  String hintText  = '';
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(10),
    ),
  );


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;

    return BlocProvider(create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state) {
          if (state is LoginSuccessState) {
            Login().localStorageLogin.setItem('token', state.loginModel.token.toString());
              Fluttertoast.showToast(
                  msg: "Bienvenue "+state.loginModel.user!.nom.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 8,
                  backgroundColor: mycolor,
                  textColor: Colors.white,
                  fontSize: 16.0
              ).then((value) => {
                Navigator.pushNamedAndRemoveUntil(context, layoutuser,
                        (route) => false,arguments: state.loginModel)
              }
              );

          }
          else if (state is LoginErrorState) {
            Fluttertoast.showToast(
                msg: state.error.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 8,
                backgroundColor: primaryColor,
                textColor: Colors.white,
                fontSize: 16.0
            );
            // .then((value) => {
            // Navigator.pushNamedAndRemoveUntil(context, LayoutVendorPage,
            //         (route) => false,arguments: state.loginModel);
            // }
            // });
          }
        },
        builder: (context,state){
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.white,
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            getProportionateScreenHeight(20), 10, 10, 0),
                        child: Image.asset(
                          'assets/images/workhive.png',
                          height: 42,
                          width: 58,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/workhive.png',
                          height: 220,
                          width: 220,
                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: 450,
                            height: 390,
                            decoration: BoxDecoration(
                                color: whitecolor,
                                // border: Border.all(
                                //     color: secondaryColor.withOpacity(0.5),
                                //     width: 1
                                // ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Login",
                                    style: textstyle.copyWith(
                                        fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                  spaceHeight(25),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Telephone',
                                          style: textstyle.copyWith(fontSize: 12),
                                        ),
                                        spaceHeight(10),
                                        TextFormInput(
                                          controller: phoneController,
                                          type: TextInputType.text,

                                          hintText: 'Telephone',
                                          suffixIcon: const Icon(
                                            Icons.phone,
                                            color: blackcolor,
                                          ),
                                          filledColor: filledColor ?? false,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return 'Numeros de telephone est requires';
                                            }
                                            else if( lgoinerror==true)
                                            {
                                              return 'There is no account with thr given credentials';
                                            }
                                            return null;
                                          },
                                        ),
                                        spaceHeight(25),
                                        Text(
                                          // 'Mot de passe',
                                          'Mot de passe',
                                          style: textstyle.copyWith(fontSize: 12),
                                        ),
                                        spaceHeight(10),
                                        TextFormInput(
                                            controller: passController,
                                            hintText:
                                            // " Mot de passe...",
                                            'Mot de passe',
                                            suffixIcon:IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  isPassword = !isPassword;
                                                });
                                              },
                                              icon:Icon(isPassword ?
                                              Icons.remove_red_eye :
                                              Icons.visibility_off,
                                                color: blackcolor,
                                              ),
                                            ),

                                            filledColor: filledColor ?? false,
                                            obsecure:  isPassword,
                                            validator: (val) {
                                              if(val!.isEmpty)
                                              {
                                                return 'Mot de passe est requis';
                                              }
                                              else if( lgoinerror==true)
                                              {
                                                return 'There is no account with thr given credentials';
                                              }


                                              return null;

                                            }
                                        ),
                                      ],
                                    ),
                                  ),
                                  // spaceHeight(1),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: [
                                  //     TextButton(
                                  //         onPressed: () {
                                  //           Navigator.pushNamed(context, forgetpassword);
                                  //         },
                                  //         child: Text(Translations.of(context)!.Motdepasseoublie,
                                  //             style: textstyle.copyWith(
                                  //               color: secondaryColor,
                                  //             ))),
                                  //   ],
                                  // ),
                                  spaceHeight(20),
                                  ConditionalBuilder(
                                      condition: state is! LoginLoadingState,
                                      builder: (context) =>
                                          DefaultButton(
                                            onTap: () {
                                              setState((){
                                                filledColor=false;
                                                lgoinerror=false;
                                              });
                                              FocusScope.of(context).requestFocus(new FocusNode());
                                              if (_formKey.currentState!.validate()) {
                                                LoginCubit.get(context).userLogin(
                                                    phone: phoneController.text,
                                                    password: passController.text
                                                );
                                              } else {
                                                setState(() {

                                                });
                                              }
                                            },
                                            buttoncolor: mycolor,
                                            // text: "Connexion",
                                            text: 'Se connecter',
                                            borderRadius: 10,
                                            width: double.infinity,
                                            height: 57,
                                          ),
                                      fallback: (context) =>
                                          DefaultButtonFallback(
                                            buttoncolor: mycolor,
                                            borderRadius: 10, width: double.infinity,
                                            height: 57,)
                                  ),
                                  spaceHeight(3)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text(
                              'Vous avez pas un compte?',
                              style:
                              textstyle.copyWith(fontSize: 12, letterSpacing: 1),
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, registrePage);
                              },
                              child: Text(
                                'inscrire',
                                style: textstyle.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      spaceHeight(20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}

