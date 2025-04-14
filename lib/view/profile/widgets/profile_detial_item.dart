import 'package:flutter/material.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/text_fonts.dart';

class ProfileDetailItem extends StatelessWidget {
  const ProfileDetailItem({
    super.key, required this.txt1, required this.txt2,
  });

  final String txt1;
  final String txt2;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: ContainerDecoration.kFloatingContainerDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 11),
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Column(children: [
          Text(
            txt1,
            style: TextFonts.klightbluefont14,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            txt2,
            style: TextFonts.kdarkgrayfont14,
          ),
        ]),
      ),
    );
  }
}
