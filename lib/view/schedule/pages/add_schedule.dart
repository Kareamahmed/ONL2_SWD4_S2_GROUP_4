
import 'package:flutter/material.dart';
import 'package:striky/models/schedule/workout_schedule.dart';
import 'package:striky/view/schedule/utilites/app_colors.dart';
import 'package:striky/view/schedule/widgets/more_options_button.dart';
import 'package:striky/view/schedule/widgets/options_dialog.dart';
import 'package:striky/view/schedule/widgets/workout_category.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';


class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  DateTime _selectedTime = DateTime.now();
  String _formattedDate = "";
  String? selectedWorkout;
  String? selectedDifficulity;

  @override
  void initState() {
    super.initState();
    _formattedDate = _getFormattedDate(DateTime.now());
  }

  String _getFormattedDate(DateTime date) {
    return DateFormat('EEE, d MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 30,
            width: 35,
            decoration: BoxDecoration(
              color: AppColors.secondColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.close, size: 20),
          ),
        ),
        title: const Center(child: Text("Add Schedule")),
        actions: [MoreOptionsButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/imgs/Icon-Calendar.png"),
                  const SizedBox(width: 8),
                  Text(
                    _formattedDate,
                    style: TextStyle(fontSize: 16, color: AppColors.greyColor),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text("Time", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 5),
              Center(
                child: TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  highlightedTextStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor,
                  ),
                  spacing: 25,
                  itemHeight: 50,
                  isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text("Details Workout", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),

              WorkoutCategory(
                image: "assets/imgs/Icon-Barbel.png",
                name: "Choose Workout",
                additionalText: selectedWorkout != null ? selectedWorkout! : "",
                onpress:
                    () => showDialog(
                      context: context,
                      builder:
                          (context) => OptionsDialog(
                            title: "Choose Workout",
                            options: [
                              'Lowerbody Workout',
                              'Upperbody Workout',
                              'Ab Workout',
                            ],
                          ),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          selectedWorkout = value;
                        });
                      }
                    }),
              ),
              const SizedBox(height: 10),

              WorkoutCategory(
                image: "assets/imgs/Icon-Swap.png",
                name: "Difficulity",
                additionalText:
                    selectedDifficulity != null ? selectedDifficulity! : "",
                onpress:
                    () => showDialog(
                      context: context,
                      builder:
                          (context) => OptionsDialog(
                            title: "Difficulty",
                            options: ['Beginner', 'Medium', 'Difficult'],
                          ),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          selectedDifficulity = value;
                        });
                      }
                    }),
              ),
              const SizedBox(height: 10),
              WorkoutCategory(
                image: "assets/imgs/Icon-Repetitions.png",
                name: "Custom Repetitions",
              ),
              const SizedBox(height: 10),
              WorkoutCategory(
                image: "assets/imgs/Icon-Weight.png",
                name: "Custom Weights",
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedWorkout != null &&
                        selectedDifficulity != null) {
                      final newSchedule = WorkoutSchedule(
                        time: _selectedTime,
                        workout: selectedWorkout!,
                      );
                      Navigator.pop(context, newSchedule);
                    } else {}
                  },

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: AppColors.mainColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Save", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
