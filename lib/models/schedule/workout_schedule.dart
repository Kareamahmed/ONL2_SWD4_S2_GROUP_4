class WorkoutSchedule {
  final DateTime time;
  final String workout;

  bool isDone;
  WorkoutSchedule({
    required this.time,
    required this.workout,

    this.isDone = false,
  });
}
