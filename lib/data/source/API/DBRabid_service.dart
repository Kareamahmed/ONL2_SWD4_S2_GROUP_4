import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:striky/data/models/workout/exercise_model.dart';

class ExerciseDBService {
  static const String _baseUrl = 'https://exercisedb.p.rapidapi.com';
  static const Map<String, String> _headers = {
    'X-RapidAPI-Key': 'df03592ba8msh7761a99b6439514p1817c5jsnfbabbc312b00',
    'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
  };

  Future<List<Exercise>> getExercisesByBodyPart(String bodyPart) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/exercises/bodyPart/$bodyPart?limit=10&offset=0'),
      headers: _headers,
    );

    print('RESPONSE STATUS: ${response.statusCode}');
    print('RESPONSE BODY: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Exercise.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load exercises');
    }
  }

  Future<Exercise> getExerciseById(String id) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/exercises/exercise/$id'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return Exercise.fromJson(data);
    } else {
      throw Exception('Failed to load exercise details');
    }
  }
}
