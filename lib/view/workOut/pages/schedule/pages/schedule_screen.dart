import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/models/schedule/workout_schedule.dart';
import 'package:striky/view/myPhotos/widgets/custom_appbar.dart';
import 'package:striky/view/workOut/pages/schedule/pages/add_schedule.dart';
import 'package:striky/view/workOut/pages/schedule/utilites/app_colors.dart';
import 'package:striky/view/workOut/widgets/workout_dialog.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDate = DateTime.now();
  late ScrollController _scrollController;
  List<WorkoutSchedule> schedules = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToToday();
    });
  }

  void _scrollToToday() {
    double todayIndex = _selectedDate.day - 1;
    double position = todayIndex * 68;
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void _changeMonth(bool isNext) {
    setState(() {
      DateTime newDate = DateTime(
        _selectedDate.year,
        isNext ? _selectedDate.month + 1 : _selectedDate.month - 1,
        _selectedDate.day,
      );
      _selectedDate = newDate;
    });
  }

  int _getDaysInMonth(DateTime date) {
    final nextMonth = (date.month == 12)
        ? DateTime(date.year + 1, 1, 1)
        : DateTime(date.year, date.month + 1, 1);
    return nextMonth.subtract(const Duration(days: 1)).day;
  }

  void markAsDone(WorkoutSchedule schedule) {
    setState(() {
      schedule.isDone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth = _getDaysInMonth(_selectedDate);
    DateTime baseDate = DateTime(_selectedDate.year, _selectedDate.month, 1);

    return Scaffold(
      backgroundColor: knormalwhite,
      appBar: CustomAppBar(
          title: "Workout Schedule",
          onpressed1: () {
            GoRouter.of(context).pop();
          },
          onpressed2: () {}),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.greyColor,
                    ),
                    onPressed: () => _changeMonth(false),
                  ),
                  Text(
                    DateFormat.yMMMM().format(_selectedDate),
                    style: TextStyle(fontSize: 18, color: AppColors.greyColor),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.greyColor,
                    ),
                    onPressed: () => _changeMonth(true),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: daysInMonth,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  DateTime currentDate = DateTime(
                    baseDate.year,
                    baseDate.month,
                    index + 1,
                  );
                  bool isSelected =
                      DateFormat('yyyy-MM-dd').format(currentDate) ==
                          DateFormat('yyyy-MM-dd').format(_selectedDate);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = currentDate;
                      });
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.mainColor
                            : AppColors.secondColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('E').format(currentDate),
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            currentDate.day.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ...schedules.map((schedule) {
              String formattedTime = DateFormat.jm().format(schedule.time);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: schedule.isDone
                            ? AppColors.secondColor
                            : AppColors.lableColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => WorkoutDialog(
                            schedule: schedule,
                            onMarkAsDone: () => markAsDone(schedule),
                          ),
                        );
                      },
                      child: Text(
                        "${schedule.workout}, ${DateFormat('h:mma').format(schedule.time).toLowerCase()}",
                        style: TextStyle(
                          color: schedule.isDone
                              ? AppColors.greyColor
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddSchedule()),
              );

              if (result != null && result is WorkoutSchedule) {
                setState(() {
                  schedules.add(result);
                });
              }
            },
            backgroundColor: AppColors.lableColor,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
