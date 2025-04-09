import 'package:flutter/material.dart';
import 'package:striky/core/constants/text_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home',style: TextFonts.kwhiteboldfont25.copyWith(color: Colors.black),),
      ),  
    );
  }
}