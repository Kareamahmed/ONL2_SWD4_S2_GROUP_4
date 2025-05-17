import 'package:flutter/material.dart';
import 'package:striky/presentation/view/workOut/widgets/chart.dart';

class BuildWorkoutProgress extends StatelessWidget {
  const BuildWorkoutProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Workout Progress',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 140,
            child: Chart(),
          )
        ],
      ),
    );
  }
}
