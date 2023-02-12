import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class TextFormInputPhone extends StatelessWidget {
  const TextFormInputPhone(
      {required this.controller,
        this.hintText,
        this.suffixIcon,
        this.filledColor = false,
        this.validator,
        this.obsecure = false,
        this.filled = true,
        this.type,
        Key? key})
      : super(key: key);

  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final TextEditingController controller;
  final String? hintText;
  final bool filledColor;
  final Widget? suffixIcon;
  final bool filled;
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(8)
      ],
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor.withOpacity(0.7)),
            borderRadius: const BorderRadius.all(Radius.circular(7)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: redcolor),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: redcolor),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: greylightycolor),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.only(left: 10, top: 15),
          fillColor: filled
              ? (filledColor)
              ? redlightcolor
              : greylightycolor
              : whitecolor,
          filled: true,
          suffixIcon: suffixIcon),
      validator: validator,
      keyboardType: type,
      obscureText: obsecure,
    );
  }
}
