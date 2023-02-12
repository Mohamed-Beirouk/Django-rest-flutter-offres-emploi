// import 'package:fastpay/presentations/components/default_button.dart';
// import 'package:fastpay/presentations/components/text_form_field.dart';
// import 'package:fastpay/presentations/constants/constants.dart';
// import 'package:fastpay/presentations/constants/strings.dart';
// import 'package:fastpay/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:fastpay/Modules/FetchDio.dart';
//
// import '../../../Modules/FetchDio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../components/default_button.dart';
import '../../components/text_form_field.dart';
import '../../constants/constants.dart';

class RestPassWord extends StatefulWidget {
  const RestPassWord({Key? key}) : super(key: key);

  @override
  State<RestPassWord> createState() => _RestPassWordState();
}

class _RestPassWordState extends State<RestPassWord> {
  bool? filledColor = false;
  String hintText = '';
  TextEditingController numberController = TextEditingController();
  String token='';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: greylightycolor,
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenHeight(20), 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/workhive.png',
                        height: 42,
                        width: 58,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/forget.png',
                    height: 220,
                    width: 220,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: whitecolor,
                        border: Border.all(
                            color: secondaryColor.withOpacity(0.5), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forget Password',
                            style: textstyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          spaceHeight(10),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Text(
                                  'Phone number',
                                  style: textstyle.copyWith(fontSize: 12),
                                ),
                                spaceHeight(10),
                                TextFormInput(
                                  controller: numberController,
                                  hintText:
                                  "Enter your phone number",
                                  filledColor: filledColor ?? false,
                                  obsecure: true,
                                  validator: (val) => (val!.isEmpty
                                      ? ''
                                      : null),
                                ),
                              ],
                            ),
                          ),
                          spaceHeight(15),
                          DefaultButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                              } else {
                                setState(() {
                                  filledColor = true;
                                });
                              }
                            },
                            buttoncolor: primaryColor,
                            text: "Send Recovey OTP",
                            borderRadius: 10,
                            width: double.infinity,
                            height: 57,
                          ),
                          spaceHeight(5),

                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
