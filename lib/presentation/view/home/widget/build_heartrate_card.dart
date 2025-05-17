import 'package:flutter/material.dart';
import 'package:striky/presentation/view/workOut/widgets/chart.dart';

class BuildHeartrateCard extends StatelessWidget {
  const BuildHeartrateCard({super.key});

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
            children: [
              Text(
                'Heart Rate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 5),
          SizedBox(height: 10),
          SizedBox(
            height: 140,
            child: Chart(),
          )
        ],
      ),
    );
  }
}
