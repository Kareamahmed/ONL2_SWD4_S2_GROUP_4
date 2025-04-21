import 'package:flutter/material.dart';

import '../../../../core/constants/global_constants.dart';

class CustomDarkTextField extends StatefulWidget {
  const CustomDarkTextField({
    super.key,
    required this.controller,
    required this.title,
  });
  final TextEditingController controller;
  final String title;

  @override
  State<CustomDarkTextField> createState() => _CustomDarkTextFieldState();
}

class _CustomDarkTextFieldState extends State<CustomDarkTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
          obscureText: obscureText,
          controller: widget.controller,
          style: TextStyle(color: Colors.grey[400]),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                Icons.visibility,
                color: obscureText ? kgreencolor : Colors.grey,
              ),
            ),
            fillColor: ksecondaryColor,
            filled: true,
            hintText: widget.title,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontFamily: kprimaryfont,
            ),
          )),
    );
  }
}
