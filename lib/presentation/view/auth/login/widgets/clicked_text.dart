import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class ClickedText extends StatelessWidget {
  const ClickedText({
    super.key,
    required this.title,
    required this.onpressed,
  });

  final String title;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Text(
        title,
        style: TextStyle(
          color: kcolor3,
          fontWeight: FontWeight.bold,
          fontFamily: kprimaryfont,
          fontSize: 16,
        ),
      ),
    );
  }
}
