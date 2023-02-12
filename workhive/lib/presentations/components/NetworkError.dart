import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'default_button.dart';

class NetworkError extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
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

            Center(
              child: Image.asset(
                'assets/images/vtp.png',
                height: 220,
                width: 220,
              ),
            ),
            spaceHeight(25),

            Center(
              child: Text(
                'Erreur de network',
                style: textstyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color:Colors.redAccent,
                ),
              ),
            ),
            Center(
              child: Text(
                'Assurer qye vous etes connecter',
              ),
            ),
            Center(
              child: Text(
                "vous pouvez redemarrer le modem",
              ),
            ),

            spaceHeight(15),

            DefaultButton(
              onTap: () {

              },
              buttoncolor: greylightycolor,
              text: 'Actualiser',
              textcolor: Colors.black,
              borderRadius: 10,
              width: double.infinity,
              height: 57,
            ),
            spaceHeight(15)
          ],
        ),
      ),
    );
  }

}