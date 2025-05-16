import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.prefix,
    required this.title,
    required this.controller,
    this.suffix,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.onChanged,
  });
  final Widget prefix;
  final Widget? suffix;
  final String title;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        validator: validator ?? (value) => null,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                height: 25,
                width: 25,
                child: prefix),
            hintText: title,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: kprimaryfont,
            )));
  }
}
