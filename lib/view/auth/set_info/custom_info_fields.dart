import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/text_fonts.dart';

class CustomInfoFields extends StatelessWidget {
  const CustomInfoFields({
    super.key, required this.prefix, required this.title, this.suffix,required this.onpressed,
  });

  final String prefix;
  final String title;
  final Icon? suffix;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(prefix),
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextFonts.kgraynormalfont12.copyWith(fontSize: 15),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: suffix,
          ),
        ]),
      ),
    );
  }
}
