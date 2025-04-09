import 'package:flutter/material.dart';
import 'package:striky/view/schedule/utilites/app_colors.dart';

class WorkoutCategory extends StatelessWidget {
  final String image;
  final String name;
  final String additionalText;
  final Function? onpress;

  const WorkoutCategory({
    super.key,
    required this.image,
    required this.name,
    this.onpress,
    this.additionalText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(name, style: TextStyle(fontSize: 17)),
            ),
            Spacer(),
            if (additionalText.isNotEmpty)
              Text(
                additionalText,
                style: TextStyle(fontSize: 14, color: AppColors.greyColor),
              ),
            IconButton(
              onPressed: () {
                if (onpress != null) {
                  onpress!();
                }
              },
              icon: Icon(Icons.arrow_forward_ios, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
