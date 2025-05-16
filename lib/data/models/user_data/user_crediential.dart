class UserCredientialModel {
  final String id;
  final String email;
  final String userName;
  final int? age;
  final double? height;
  final double? weight;
  final String? goal;
  final String? fitnessLevel;
  final String photo;

  UserCredientialModel({
    required this.id,
    required this.email,
    required this.userName,
    this.age,
    this.height,
    this.weight,
    this.goal,
    this.fitnessLevel,
    required this.photo,
  });

  factory UserCredientialModel.fromJson(Map<String, dynamic> json) {
    return UserCredientialModel(
      id: json['id'],
      email: json['email'],
      userName: json['userName'],
      age: json['age'],
      height: (json['height'] != null) ? json['height'].toDouble() : null,
      weight: (json['weight'] != null) ? json['weight'].toDouble() : null,
      goal: json['goal'],
      fitnessLevel: json['fitnessLevel'],
      photo: json['photo'] ?? '',
    );
  }
}
