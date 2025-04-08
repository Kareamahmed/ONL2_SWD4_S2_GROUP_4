// app text fonts

import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class TextFonts {

  static const TextStyle kwhiteboldfont25 = TextStyle(
  fontSize: 25,
   fontWeight: FontWeight.bold, 
   color: Colors.white,
   fontFamily: kprimaryfont,);

  static const TextStyle kwhitenormalfont12 = TextStyle(
  fontSize: 12,
   color: Colors.white,
   fontFamily: kprimaryfont,);

  static const TextStyle kgraynormalfont16 = TextStyle(
  fontSize: 16,
   color: kstandardgrey,
   fontFamily: kprimaryfont,);

     static const TextStyle kdarkboldfont16 = TextStyle(
  fontSize: 16,
   color: kstandardblack,
   fontWeight: FontWeight.bold,
   fontFamily: kprimaryfont,);

     static const TextStyle kgraynormalfont12 = TextStyle(
  fontSize: 12,
   color: klightgrey,
   fontFamily: kprimaryfont,);

   
}
