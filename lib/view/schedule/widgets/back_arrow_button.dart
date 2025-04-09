import 'package:flutter/material.dart';
import 'package:striky/view/schedule/utilites/app_colors.dart';

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
          color: AppColors.secondColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.arrow_back_ios, size: 18),
      ),
    );
  }
}
