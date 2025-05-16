import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/presentation/cubits/auth/setInfo/setinfo_cubit.dart';
import 'package:striky/presentation/view/auth/login/widgets/main_custom_button.dart';

class NextButton extends StatelessWidget {
  final String goal;
  final bool isMale;
  final TextEditingController ageController;
  final int height;
  final int weight;

  const NextButton({
    super.key,
    required this.goal,
    required this.isMale,
    required this.ageController,
    required this.height,
    required this.weight,
  });

  Future<String> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kshareduserId) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return MainCustomButton(
      title: 'Next',
      onPressed: () async {
        String userId = await _getUserId();
        if (userId.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User ID not found!')),
          );
          return;
        }
        int? age = int.tryParse(ageController.text);
        if (age == null || age <= 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please enter a valid age')),
          );
          return;
        }
        // context.read<SetinfoCubit>().setinfo(
        //       goal,
        //       isMale ? 'Male' : 'Female',
        //       height,
        //       weight,
        //       userId,
        //       age,
        //     );
        context
            .read<SetinfoCubit>()
            .setinfo(goal, 'intermediate', height, weight, userId, age);
      },
    );
  }
}
