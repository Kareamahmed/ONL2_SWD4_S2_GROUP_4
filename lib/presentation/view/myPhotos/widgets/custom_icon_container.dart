import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class CustomIconContainer extends StatelessWidget {
  const CustomIconContainer(
      {super.key,
      required this.child,
      required this.onpressed,
      this.height = 55,
      this.width = 55});

  final Widget child;
  final void Function() onpressed;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.all(10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: kwaterwhite,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
