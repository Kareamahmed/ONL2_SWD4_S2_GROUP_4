import 'package:flutter/material.dart';
import 'package:striky/core/constants/text_fonts.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Analysis',style: TextFonts.kwhiteboldfont25.copyWith(color: Colors.black,)),),);
  }
}