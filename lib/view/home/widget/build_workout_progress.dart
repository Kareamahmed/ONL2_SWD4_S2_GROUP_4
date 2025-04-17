import 'package:flutter/material.dart';

class BuildWorkoutProgress extends StatelessWidget {
  const BuildWorkoutProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Workout Progress',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Chip(label: Text('Weekly'),),
          ],
        ),
        const SizedBox(height: 10),
        const Placeholder(fallbackHeight: 100),
      ],
    );
  }
}