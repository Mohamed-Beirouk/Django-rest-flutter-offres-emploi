import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../../constants/constants.dart';
class RegistreScreen extends StatefulWidget {

  LocalStorage localStorage =new LocalStorage('storage');

  @override
  State<RegistreScreen> createState() => _RegistreScreenState();
}

class _RegistreScreenState extends State<RegistreScreen> {
  bool? filledColor = false;
  bool loading = false;

  String hintText = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nniController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: greylightycolor,
          height: size.height,
          width: size.width,

          // child: SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.fromLTRB(
          //             getProportionateScreenHeight(10), 5, 28, 0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             IconButton(
          //               icon: Icon(CupertinoIcons.back),
          //               onPressed: () {
          //                 Navigator.pop(context);
          //               },
          //             ),
          //             Image.asset(
          //               'assets/images/workhive.png',
          //               height: 38,
          //               width: 54,
          //
          //             ),
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding:
          //         const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          //         child: Container(
          //           width: 350,
          //           decoration: BoxDecoration(
          //               color: whitecolor,
          //               border: Border.all(
          //                   color: secondaryColor.withOpacity(0.5), width: 1),
          //               borderRadius: BorderRadius.circular(10)),
          //           child: Padding(
          //             padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   Translations.of(context)!.Creeuncompte,
          //                   style: textstyle.copyWith(
          //                       fontWeight: FontWeight.w600, fontSize: 22),
          //                 ),
          //                 spaceHeight(25),
          //                 Form(
          //                   key: _formKey,
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         Translations.of(context)!.nom,
          //                         style: textstyle.copyWith(fontSize: 12),
          //                       ),
          //                       spaceHeight(10),
          //                       TextFormInput(
          //                         controller: nameController,
          //                         hintText: Translations.of(context)!.nom,
          //                         filledColor: filledColor ?? false,
          //                         validator: (val) => (val!.isEmpty
          //                             ? 'Le nom complet est requis '
          //                             : null),
          //                       ),
          //                       spaceHeight(20),
          //                       Text(
          //                           Translations.of(context)!.Prenom,
          //                         style: textstyle.copyWith(fontSize: 12),
          //                       ),
          //                       spaceHeight(10),
          //                       TextFormInput(
          //                         controller: birthdayController,
          //                         hintText: Translations.of(context)!.Datedenaissance,
          //                         filledColor: filledColor ?? false,
          //                         validator: (val) => (val!.isEmpty
          //                             ? 'Date de naissance est requise'
          //                             : null),
          //                       ),
          //                       spaceHeight(20),
          //                       Text(
          //                         Translations.of(context)!.Telephone,
          //                         style: textstyle.copyWith(fontSize: 12),
          //                       ),
          //                       spaceHeight(10),
          //                       TextFormInput(
          //                         controller: phoneController,
          //                         type: TextInputType.number,
          //                         hintText: Translations.of(context)!.Telephone,
          //                         filledColor: filledColor ?? false,
          //                         validator: (val) => (val!.isEmpty
          //                             ? 'Téléphone est requis'
          //                             : null),
          //                       ),
          //                       spaceHeight(20),
          //                       Text(
          //                         Translations.of(context)!.Nni,
          //                         style: textstyle.copyWith(fontSize: 12),
          //                       ),
          //                       spaceHeight(10),
          //                       TextFormInput(
          //                         controller: nniController,
          //                         type: TextInputType.number,
          //                         hintText: Translations.of(context)!.Nni,
          //                         filledColor: filledColor ?? false,
          //                         validator: (val) => (val!.isEmpty
          //                             ? 'NNI est requis'
          //                             : null),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 spaceHeight(10),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       "Vous avez déja un compte?",
          //                       style: textstyle.copyWith(
          //                         color: secondaryColor,
          //                       ),
          //                     ),
          //                     TextButton(
          //                         onPressed: () {
          //                           Navigator.pushNamed(context, loginPage);
          //                         },
          //                         child: Text(
          //                           Translations.of(context)!.login,
          //                           style: textstyle.copyWith(
          //                               color: blackcolor,
          //                               fontWeight: FontWeight.w700),
          //                         ))
          //                   ],
          //                 ),
          //                 spaceHeight(10),
          //
          //                 loading?Center(child: CircularProgressIndicator(color:primaryColor))
          //                 :DefaultButton(
          //
          //                   onTap: () async {
          //                     if (_formKey.currentState!.validate()) {
          //                       setState(() {
          //                         loading=true;
          //                       });
          //
          //                       // print("___________________________________"+RegistreScreen().localStorage.getItem('phone'));
          //                       print(RegistreScreen().localStorage.getItem('birthday'));
          //                       print(RegistreScreen().localStorage.getItem('name'));
          //                       print(RegistreScreen().localStorage.getItem('nni'));
          //                       RegistreScreen().localStorage.setItem('name', nameController.text);
          //                       RegistreScreen().localStorage.setItem('birthday', birthdayController.text);
          //                       RegistreScreen().localStorage.setItem('phone', phoneController.text);
          //                       RegistreScreen().localStorage.setItem('nni', nniController.text);
          //
          //
          //
          //
          //
          //
          //
          //
          //                       // await FirebaseAuth.instance.verifyPhoneNumber(
          //                       //   phoneNumber: '+222${phoneController.text}',
          //                       //   verificationCompleted:
          //                       //       (PhoneAuthCredential credential) {},
          //                       //   verificationFailed:
          //                       //       (FirebaseAuthException e) {
          //                       //     setState(() {
          //                       //       loading=false;
          //                       //     });
          //                       //   },
          //                       //   codeSent:
          //                       //       (String verificationId, int? resendToken) {
          //                       //     setState(() {
          //                       //       loading=false;
          //                       //     });
          //                       //     Navigator.push(
          //                       //         context, MaterialPageRoute(builder: (context)=>
          //                       //         OTP_verification(verificationId: verificationId,)
          //                       //     )
          //                       //     );
          //                       //   },
          //                       //   codeAutoRetrievalTimeout:
          //                       //       (String verificationId) {
          //                       //
          //                       //   },
          //                       // );
          //                     } else {
          //                       setState(() {
          //                         filledColor = true;
          //                       });
          //                     }
          //                   },
          //                   buttoncolor: primaryColor,
          //                   text: "Continuer ",
          //                   borderRadius: 10,
          //                   width: double.infinity,
          //                   height: 57,
          //                   suffixIcon: const Icon(
          //                     CupertinoIcons.forward,
          //                     color: whitecolor,
          //                   ),
          //                 ),
          //
          //                 spaceHeight(15)
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );

  }
}
