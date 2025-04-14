import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class ContainerDecoration {
  static BoxDecoration kContainerwaterDecoration = BoxDecoration(
    color: kwaterwhite,
    borderRadius: BorderRadius.circular(35),
  );

  static BoxDecoration kContainerRoundedDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );

  static BoxDecoration kFloatingContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: kwaterwhite,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ]);
}
