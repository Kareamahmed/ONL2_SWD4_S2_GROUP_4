import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/data/models/workout/general_workout_model.dart';

class WorkoutInfoCard extends StatelessWidget {
  const WorkoutInfoCard({super.key, required this.generalWorkoutModel});

  final GeneralWorkoutModel generalWorkoutModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 155,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kwaterwhite, // Light blue background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Left side: Texts
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  generalWorkoutModel.title,
                  style: TextFonts.kgraynormalfont16.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  '${generalWorkoutModel.exerciseNo} Exercises | ${generalWorkoutModel.duration} mins',
                  style: TextFonts.kdarkgrayfont14.copyWith(fontSize: 12),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: generalWorkoutModel.onTapped,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'View more',
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontFamily: kprimaryfont,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Right side: Im,age
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 90,
                backgroundColor: Colors.white,
              ),
              SvgPicture.asset(
                generalWorkoutModel.image,
                fit: BoxFit.contain,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
