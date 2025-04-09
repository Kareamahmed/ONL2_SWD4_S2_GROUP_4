import 'package:flutter/material.dart';
import 'package:striky/view/schedule/utilites/app_colors.dart';

class MoreOptionsButton extends StatelessWidget {
  final VoidCallback? onPress;
  const MoreOptionsButton({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPress;
      },
      icon: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: AppColors.secondColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset("assets/imgs/Group 9975.png"),
      ),
    );
  }
}
