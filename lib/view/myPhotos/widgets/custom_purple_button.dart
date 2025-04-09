import 'package:flutter/material.dart';
import 'package:striky/core/constants/text_fonts.dart';

class CustomPurpleButton extends StatelessWidget {
  const CustomPurpleButton({super.key, required this.text, this.onpressed});
  
  final String text;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF7BA5FF), Color(0xFF9F87FF)], // Adjust gradient colors if you want
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(30), // High value for pill shape
      ),
      child: TextButton(
    onPressed: onpressed,
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      foregroundColor: Colors.white, // Text color
      textStyle: TextFonts.kwhitenormalfont12
    ),
    child: Text(text , style: TextFonts.kwhitenormalfont12,),
      ),
    )
;
  }
}