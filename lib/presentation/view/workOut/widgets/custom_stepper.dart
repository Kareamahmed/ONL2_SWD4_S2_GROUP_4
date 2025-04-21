import 'package:flutter/material.dart';
import 'package:striky/presentation/view/workOut/widgets/step_item.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        4,
        (index) => StepItem(
          title: 'Spread Your Arms',
          description:
              'To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.',
        ),
      ),
    );
  }
}
