import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 6,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: klightgrey2,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
