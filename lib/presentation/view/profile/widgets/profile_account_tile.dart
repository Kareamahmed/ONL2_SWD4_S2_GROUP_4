import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';

class ProfileAccountTile extends StatelessWidget {
  const ProfileAccountTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onpress,
  });

  final String title;
  final String leadingIcon;
  final void Function() onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: ListTile(
        visualDensity: VisualDensity(vertical: -4),
        leading: SvgPicture.asset(
          leadingIcon,
          colorFilter: ColorFilter.mode(kprimaryColor, BlendMode.srcIn),
        ),
        title: Text(title, style: TextFonts.kdarkgrayfont14),
        trailing: SvgPicture.asset(karrowright,
            colorFilter:
                ColorFilter.mode(Colors.grey.shade700, BlendMode.srcIn)),
      ),
    );
  }
}
