import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SvgPicture.asset(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextFonts.kdarkboldfont14,
        ),
        subtitle: Text(
          subtitle,
          style: TextFonts.kgraynormalfont12,
        ),
        trailing: const Icon(
          Icons.arrow_circle_right_outlined,
          color: klightgrey,
        ),
      ),
    );
  }
}
