import 'package:flutter/material.dart';

import '../constants/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {this.buttoncolor,
      this.textcolor,
      this.textsize,
      this.height,
      this.width,
      this.text,
      required this.onTap,
      this.hasborder,
      this.borderRadius,
      this.prefixIcon,
      this.suffixIcon,
      Key? key})
      : super(key: key);

  final Color? buttoncolor;
  final Color? textcolor;
  final double? textsize;
  final double? height;
  final double? width;
  final String? text;
  final void Function() onTap;
  final bool? hasborder;
  final double? borderRadius;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 45,
        width: width ?? 250,
        decoration: BoxDecoration(
            border: (hasborder ?? false)
                ? Border.all(color: textcolor ?? Colors.black)
                : null,
            color: buttoncolor ?? primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          prefixIcon ?? Container(),
          Text(
            text ?? '',
            style: TextStyle(
                fontSize: textsize ?? 16,
                fontWeight: FontWeight.w600,
                color: textcolor ?? Colors.white),
          ),
          suffixIcon ?? Container()
        ]),
      ),
    );
  }
}


//-------------------------------------------------------------
class DefaultButtonFallback extends StatelessWidget {
  const DefaultButtonFallback(
      {this.buttoncolor,
        this.textcolor,
        this.textsize,
        this.height,
        this.width,
        this.text,
        this.hasborder,
        this.borderRadius,
        this.prefixIcon,
        this.suffixIcon,
        Key? key})
      : super(key: key);

  final Color? buttoncolor;
  final Color? textcolor;
  final double? textsize;
  final double? height;
  final double? width;
  final String? text;
  final bool? hasborder;
  final double? borderRadius;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: height ?? 45,
        width: width ?? 250,
        decoration: BoxDecoration(
            border: (hasborder ?? false)
                ? Border.all(color: textcolor ?? Colors.black)
                : null,
            color: buttoncolor ?? primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          prefixIcon ?? Container(),
          Center(child: CircularProgressIndicator(color:Colors.white)),
          suffixIcon ?? Container()
        ]),
      ),
    );
  }
}
