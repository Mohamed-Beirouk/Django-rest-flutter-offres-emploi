import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';

class CustomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/workhive.png',
          height: 38,
          width: 54,
        ),
        InkWell(
          onTap: (){

          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(5),
                getProportionateScreenHeight(15),
                getProportionateScreenWidth(5),
                getProportionateScreenHeight(15)),
            child: SvgPicture.asset(
              "assets/svg/menu.svg",
            ),
          ),
        ),
      ],
    );
  }
}