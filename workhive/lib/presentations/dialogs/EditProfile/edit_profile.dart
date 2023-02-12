
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../data/models/login_model.dart';
import '../../../size_config.dart';
import '../../components/default_button.dart';
import '../../components/text_form_field.dart';
import '../../constants/constants.dart';
import '../../constants/strings.dart';
import '../../screens/Registre/registre.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class VendorEditProfile extends StatefulWidget {
  final LoginModel? loginmodel;
  const VendorEditProfile({Key? key, required this.loginmodel}) : super(key: key);
  @override
  State<VendorEditProfile> createState() => _VendorEditProfileState();
}

class _VendorEditProfileState extends State<VendorEditProfile> {
  bool? filledColor = false;
  String hintText = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if(nameController.text.isEmpty){
      prenomController.text=widget.loginmodel!.token.toString();
      phoneController.text=widget.loginmodel!.message.toString();
    }
    return BlocProvider(create: (BuildContext context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context,state){
          if(state is ProfileSuccessState)
          {
            setState(() {
              Navigator.pushNamedAndRemoveUntil(context, layoutuser,(route) => false,arguments: RegistreScreen().localStorage.getItem('argstore'));
            });
          }
          if(state is ProfileErrorState)
          {
            Fluttertoast.showToast(
                msg: 'Error',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 8,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        builder: (context,state){
          return Padding(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(20),
                getProportionateScreenHeight(25),
                getProportionateScreenWidth(20),
                getProportionateScreenHeight(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Modifier le profile',
                      style: textstyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: getProportionateScreenHeight(22)),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(
                        "assets/svg/close.svg",
                      ),
                    ),
                  ],
                ),
                spaceHeight(getProportionateScreenHeight(25)),
                Form(
                  key: _formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nom',
                        style: textstyle.copyWith(
                            fontSize: getProportionateScreenHeight(12)),
                      ),
                      spaceHeight(getProportionateScreenHeight(10)),
                      TextFormInput(
                        controller: nameController,
                        hintText:'Nom',
                        filledColor: filledColor ?? false,
                        validator: (val) =>
                        (val!.isEmpty ? 'name is required ' : null),
                      ),
                      spaceHeight(getProportionateScreenHeight(20)),
                      Text(
                        'prenom',
                        style: textstyle.copyWith(
                            fontSize: getProportionateScreenHeight(12)),
                      ),
                      spaceHeight(getProportionateScreenHeight(10)),
                      TextFormInput(
                        controller: prenomController,
                        hintText: 'Prenom',
                        filledColor: filledColor ?? false,
                        validator: (val) =>
                        (val!.isEmpty ? 'prenom is required ' : null),
                      ),
                      spaceHeight(getProportionateScreenHeight(20)),
                      Text(
                        'Telephone',
                        style: textstyle.copyWith(
                            fontSize: getProportionateScreenHeight(12)),
                      ),
                      spaceHeight(getProportionateScreenHeight(10)),
                      TextFormInput(
                        controller: phoneController,
                        hintText: 'Telephone',
                        filledColor: filledColor ?? false,
                        validator: (val) =>
                        (val!.isEmpty ? 'Note is required ' : null),
                      ),
                    ],
                  ),
                ),
                spaceHeight(getProportionateScreenHeight(30)),
                ConditionalBuilder(
                  condition: state is! ProfileLoadingState,
                  builder: (context) => DefaultButton(
                    onTap: () {
                      if (_formKey1.currentState!.validate()) {
                        ProfileCubit.get(context).updateProfile(
                            id: int.parse(widget.loginmodel!.user!.nom.toString()),
                            nom: nameController.text,
                            prenom: prenomController.text,
                            telephone: phoneController.text
                        );
                      } else {
                        setState(() {
                          filledColor = true;
                        });
                      }
                    },
                    buttoncolor: primaryColor,
                    text:'Confirmer',
                    borderRadius: getProportionateScreenHeight(10),
                    width: double.infinity,
                    height: getProportionateScreenHeight(57),
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator(color:primaryColor)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
