import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: ksecondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.arrow_back_ios, size: 18),
      ),
    );
  }
}
