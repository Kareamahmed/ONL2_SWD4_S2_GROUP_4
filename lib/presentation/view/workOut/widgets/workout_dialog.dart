import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/data/models/schedule/workout_schedule.dart';

class WorkoutDialog extends StatelessWidget {
  final WorkoutSchedule schedule;
  final VoidCallback onMarkAsDone;

  const WorkoutDialog({
    super.key,
    required this.schedule,
    required this.onMarkAsDone,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isToday = now.year == schedule.time.year &&
        now.month == schedule.time.month &&
        now.day == schedule.time.day;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, size: 24),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Workout Schedule",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                schedule.workout,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.access_time, color: klightgrey),
                const SizedBox(width: 8),
                Text(
                  "${isToday ? 'Today' : DateFormat('EEE, MMM d').format(schedule.time)} | ${DateFormat('hh:mm a').format(schedule.time)}",
                  style: TextStyle(color: klightgrey, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  onMarkAsDone();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kprimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Mark as Done",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
