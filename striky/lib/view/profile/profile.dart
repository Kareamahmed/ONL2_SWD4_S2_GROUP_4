import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:striky/core/constants/text_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Profile',style: TextFonts.kwhiteboldfont25.copyWith(color: Colors.black),)),);
  }
}