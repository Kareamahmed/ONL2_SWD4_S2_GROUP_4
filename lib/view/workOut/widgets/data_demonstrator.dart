
import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';

class DataDemonstrator extends StatelessWidget {
  const DataDemonstrator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 80,
      child: Container(
        width: 200,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
         
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row (Date and Percentage)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fri, 28 May",
                  style: TextFonts.kgraynormalfont12,
                ),
                Text(
                  "90% ↑",
                  style: TextStyle(fontSize: 12, color: Colors.green , fontWeight: FontWeight.bold,fontFamily: kprimaryfont),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Workout Title
            Text(
              "Upperbody Workout",
              style: TextStyle(
                fontFamily: kprimaryfont,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            // Progress Bar
            LinearProgressIndicator(
              value: 0.9,
              minHeight: 6,
              backgroundColor: Colors.grey[300],
              color: kcolor3,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }
}
