import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/presentation/view/myPhotos/widgets/custom_icon_container.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onpressed1,
    required this.onpressed2,
  });

  final String title;
  final void Function() onpressed1;
  final void Function() onpressed2;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextFonts.kdarkboldfont16,
      ),
      backgroundColor: Colors.white,
      leading: CustomIconContainer(
        onpressed: onpressed1,
        child: Icon(Icons.arrow_back_ios_new_rounded,
            size: 20, color: Colors.black87),
      ),
      actions: [
        CustomIconContainer(
          onpressed: onpressed2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: SvgPicture.asset(
              ktwodots,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
