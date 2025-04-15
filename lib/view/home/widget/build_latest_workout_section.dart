import 'package:flutter/material.dart';
import 'package:striky/view/home/widget/work_title.dart';

class BuildLatestWorkoutSection extends StatelessWidget {
  const BuildLatestWorkoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Latest Workout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See more', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        WorkTitle('Fullbody Workout', '180 calories | 20 minutes'),
        WorkTitle('Lowerbody Workout', '250 calories | 25 minutes'),
        WorkTitle('Ab Workout', '200 calories | 20 minutes'),
      ],
    );
  }
}
