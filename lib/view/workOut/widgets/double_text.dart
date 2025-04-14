
import 'package:flutter/material.dart';
import 'package:striky/core/constants/text_fonts.dart';

class DoubleText extends StatelessWidget {
  const DoubleText({
    super.key, required this.text1, required this.text2,
  });
 
 final String text1;
 final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10.0, horizontal: 5),
      child: Row(
        children: [
          Text(
            text1,
            style: TextFonts.kdarkboldfont14,
          ),
          Spacer(),
          Text(
            text2,
            style: TextFonts.kgraynormalfont12,
          ),
        ],
      ),
    );
  }
}
