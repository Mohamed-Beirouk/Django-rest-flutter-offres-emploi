import 'package:workHive/presentations/constants/strings.dart';
import 'package:workHive/presentations/screens/Registre/registre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';
import '../../components/BottomNavBar.dart';
import '../../constants/constants.dart';

class VendorSettings extends StatefulWidget {

  @override
  State<VendorSettings> createState() => _VendorSettingsState();
}
class _VendorSettingsState extends State<VendorSettings> {
  bool dark=false;
  Brightness brightness = Brightness.light;
  void toggleBrightness() {
    setState(() {
      brightness = (brightness == Brightness.light) ? Brightness.dark : Brightness.light;
      RegistreScreen().localStorage.setItem('brightness', brightness);
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String idofvendor= ModalRoute.of(context)!.settings.arguments as String;
    return WillPopScope(
        onWillPop: () async {
      Navigator.pushNamedAndRemoveUntil(context, layoutuser, (route) => false);
      return false;
    },
    child: Scaffold(

        body: SafeArea(
          child: Container(
            color: greylightycolor,
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: whitecolor,
                    height: getProportionateScreenHeight(60),
                    padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(15),
                      getProportionateScreenHeight(0),
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.back,
                                size: 18,
                              ),
                              Text(
                                'Profile',
                                style: textstyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: getProportionateScreenHeight(14)),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Settings Vendor',
                          style: textstyle.copyWith(
                              color: secondaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: getProportionateScreenHeight(16)),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(5),
                              getProportionateScreenHeight(15),
                              getProportionateScreenWidth(5),
                              getProportionateScreenHeight(15)),
                          child: SvgPicture.asset(
                            "assets/svg/menu.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                  spaceHeight(
                    getProportionateScreenHeight(10),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(10),
                        getProportionateScreenHeight(10),
                        getProportionateScreenWidth(10),
                        getProportionateScreenHeight(5)),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(15),
                              getProportionateScreenHeight(20),
                              getProportionateScreenWidth(15),
                              getProportionateScreenHeight(15)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(10)),
                              color: whitecolor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(0),
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(10)),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/lock.svg'),
                                      spaceWidth(getProportionateScreenWidth(12)),
                                      Text(
                                        'Change password',
                                        style: textstyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            getProportionateScreenHeight(16)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: secondaryColor.withOpacity(0.2),
                              ),
                              spaceHeight(getProportionateScreenHeight(10)),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(0),
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(10)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svg/factor_auth.svg'),
                                    spaceWidth(getProportionateScreenWidth(12)),
                                    Text(
                                      'Two-Factor Authentification ',
                                      style: textstyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                          getProportionateScreenHeight(16)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        spaceHeight(getProportionateScreenHeight(25)),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(15),
                              getProportionateScreenHeight(20),
                              getProportionateScreenWidth(15),
                              getProportionateScreenHeight(15)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(10)),
                              color: whitecolor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(0),
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(10)),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/notifications.svg'),
                                      spaceWidth(getProportionateScreenWidth(12)),
                                      Text(
                                        'Notifications',
                                        style: textstyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            getProportionateScreenHeight(16)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: secondaryColor.withOpacity(0.2),
                              ),
                              spaceHeight(getProportionateScreenHeight(10)),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(0),
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(10)),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/globe.svg'),
                                      spaceWidth(getProportionateScreenWidth(12)),
                                      Text(
                                        'Language',
                                        style: textstyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            getProportionateScreenHeight(16)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: secondaryColor.withOpacity(0.2),
                              ),
                              spaceHeight(getProportionateScreenHeight(10)),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(0),
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(10)),
                                child: InkWell(
                                  onTap:(){
                                    toggleBrightness();
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/moon.svg'),
                                      spaceWidth(getProportionateScreenWidth(12)),
                                      Text(
                                        'Dark Mode ',
                                        style: textstyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            getProportionateScreenHeight(16)),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        spaceHeight(getProportionateScreenHeight(25)),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(15),
                              getProportionateScreenHeight(20),
                              getProportionateScreenWidth(15),
                              getProportionateScreenHeight(15)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(10)),
                              color: whitecolor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(0),
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(10)),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/help.svg'),
                                      spaceWidth(getProportionateScreenWidth(12)),
                                      Text(
                                        'Help',
                                        style: textstyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            getProportionateScreenHeight(16)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: secondaryColor.withOpacity(0.2),
                              ),
                              spaceHeight(getProportionateScreenHeight(10)),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(0),
                                    getProportionateScreenWidth(15),
                                    getProportionateScreenHeight(10)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/tel.svg'),
                                    spaceWidth(getProportionateScreenWidth(12)),
                                    Text(
                                      'Contact Us ',
                                      style: textstyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                          getProportionateScreenHeight(16)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(pageIndex: 3),
      ),
    );
  }
}
