class GeneralExerciseModel {
  int? id;
  String? name;
  String? photoUrl;
  int? countExercises;

  GeneralExerciseModel({
    this.id,
    this.name,
    this.photoUrl,
    this.countExercises,
  });

  factory GeneralExerciseModel.fromJson(Map<String, dynamic> json) {
    return GeneralExerciseModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      countExercises: json['countExercises'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
        'countExercises': countExercises,
      };
}
