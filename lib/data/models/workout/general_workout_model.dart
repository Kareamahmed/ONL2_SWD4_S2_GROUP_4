class GeneralWorkoutModel {
  final String title;
  final String exerciseNo;
  final String duration;
  final String image;
  final void Function()? onTapped;

  GeneralWorkoutModel(
      {required this.image,
      required this.title,
      required this.exerciseNo,
      required this.duration,
      required this.onTapped});
}
