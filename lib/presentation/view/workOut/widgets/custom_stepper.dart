import 'package:flutter/material.dart';
import 'package:striky/presentation/view/workOut/widgets/step_item.dart';

class CustomStepper extends StatelessWidget {
  final List<String> instructions;

  const CustomStepper({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        instructions.length,
        (index) => StepItem(
          title: 'Step ${index + 1}',
          description: instructions[index],
        ),
      ),
    );
  }
}
