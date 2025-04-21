import 'package:flutter/material.dart';
import 'package:striky/presentation/view/home/widget/bmi_card.dart';
import 'package:striky/presentation/view/home/widget/build_heartrate_card.dart';
import 'package:striky/presentation/view/home/widget/build_latest_workout_section.dart';
import 'package:striky/presentation/view/home/widget/build_today_targetcard.dart';
import 'package:striky/presentation/view/home/widget/build_workout_progress.dart';
import 'package:striky/presentation/view/home/widget/header.dart';
import 'package:striky/presentation/view/home/widget/stat_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                const SizedBox(height: 20),
                BMICard(),
                const SizedBox(height: 15),
                BuildTodayTargetcard(),
                const SizedBox(height: 20),
                const Text(
                  'Activity Status',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                BuildHeartrateCard(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    StatCard("Steps", "8,765"),
                    StatCard("Steps", "8,765"),
                  ],
                ),
                const SizedBox(height: 20),
                BuildWorkoutProgress(),
                const SizedBox(height: 20),
                BuildLatestWorkoutSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
