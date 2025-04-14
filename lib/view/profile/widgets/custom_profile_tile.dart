import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/view/myPhotos/widgets/custom_purple_button.dart';

class CustomProfileTile extends StatelessWidget {
  const CustomProfileTile({
    super.key, required this.img, required this.name, required this.program,
  });

  final String img;
  final String name;
  final String program;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: kprimaryColor,
        child: SvgPicture.asset(img),
      ),
      title: Text(
        name,
        style: TextFonts.kdarkboldfont14.copyWith(color: Colors.black),
      ),
      subtitle: Text(
        program,
        style: TextFonts.kgraynormalfont12,
      ),
      trailing: CustomPurpleButton(text: ' Edit ', onpressed: () {}),
    );
  }
}
