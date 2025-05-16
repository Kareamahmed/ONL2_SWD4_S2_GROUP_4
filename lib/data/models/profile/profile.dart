class ProfileModel {
  String? id;
  String? email;
  String? userName;
  dynamic age;
  dynamic height;
  dynamic weight;
  dynamic goal;
  dynamic fitnessLevel;
  String? photo;

  ProfileModel({
    this.id,
    this.email,
    this.userName,
    this.age,
    this.height,
    this.weight,
    this.goal,
    this.fitnessLevel,
    this.photo,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'] as String?,
        email: json['email'] as String?,
        userName: json['userName'] as String?,
        age: json['age'] as dynamic,
        height: json['height'] as dynamic,
        weight: json['weight'] as dynamic,
        goal: json['goal'] as dynamic,
        fitnessLevel: json['fitnessLevel'] as dynamic,
        photo: json['photo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'userName': userName,
        'age': age,
        'height': height,
        'weight': weight,
        'goal': goal,
        'fitnessLevel': fitnessLevel,
        'photo': photo,
      };
}
