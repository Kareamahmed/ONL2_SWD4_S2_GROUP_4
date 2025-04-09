import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class StepItem extends StatelessWidget {
  final String title;
  final String description;

  const StepItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
          
            SizedBox(height: 4),
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer Circle
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:klightpurple, width: 1),
                  ),
                ),
                // Inner Filled Circle
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:klightpurple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            // Dashed Line
            Container(
              width: 2,
              height: 60,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xffce90ea),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        // Right side: Title + Description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
