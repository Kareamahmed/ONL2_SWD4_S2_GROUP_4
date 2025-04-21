import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.prefix,
    required this.title,
    required this.controller,
    this.suffix,
  });
  final Widget prefix;
  final Widget? suffix;
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
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
