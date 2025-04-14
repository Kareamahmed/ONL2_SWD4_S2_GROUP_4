
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/text_fonts.dart';

class ExGears extends StatelessWidget {
  const ExGears({
    super.key, required this.image, required this.name,
  });

final String image;
final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
        margin: EdgeInsets.all(10),
        height: 130,
        width: 120,
        decoration: ContainerDecoration.kFloatingContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(image),
        ),
      ),
        
      Text(name,style: TextFonts.kdarkboldfont14,),
       
    ]);
  }
}
