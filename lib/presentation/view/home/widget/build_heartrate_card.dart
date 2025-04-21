import 'package:flutter/material.dart';

class BuildHeartrateCard extends StatelessWidget {
  const BuildHeartrateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Heart Rate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // Chip(
              //   label: Text(
              //     '3 mins ago',
              //     style: TextStyle(fontSize: 12, color: Colors.white),
              //   ),
              //    backgroundColor: Colors.pinkAccent,
              // ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            '78 BPM',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff92A3FD),
            ),
          ),
          const SizedBox(height: 10),
          const Placeholder(fallbackHeight: 80),
        ],
      ),
    );
  }
}
