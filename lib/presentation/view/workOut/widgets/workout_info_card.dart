import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';

class WorkoutInfoCard extends StatelessWidget {
  const WorkoutInfoCard({super.key,  required this.id, this.name, this.photoUrl, this.countExercises});

  final int id;
  final String? name;
  final String? photoUrl;
  final int? countExercises;
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
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 name!,
                  style: TextFonts.kgraynormalfont16.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  '$countExercises Exercises ',
                  style: TextFonts.kdarkgrayfont14.copyWith(fontSize: 12),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.exerciseworkOut,
                        extra: name);
                  },
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
            flex: 2,
              child: ClipRRect(
    borderRadius: BorderRadius.circular(25), // half of width/height
    child: SvgPicture.asset(
      photoUrl!,
      fit: BoxFit.cover,
    ),
  )),
        ],
      ),
    );
  }
}
