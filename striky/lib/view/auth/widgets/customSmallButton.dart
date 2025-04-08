import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/global_constants.dart';

class Customsmallbutton extends StatelessWidget {
  const Customsmallbutton({
    super.key,
    required this.title,required this.onTap,
  });

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(75),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kcolor3,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: kprimaryfont,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
