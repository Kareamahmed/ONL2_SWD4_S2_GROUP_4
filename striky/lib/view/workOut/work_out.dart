import 'package:flutter/material.dart';
import 'package:striky/core/constants/text_fonts.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('WorkOut',style: TextFonts.kwhiteboldfont25.copyWith(color: Colors.black),)),
    );
  }
}