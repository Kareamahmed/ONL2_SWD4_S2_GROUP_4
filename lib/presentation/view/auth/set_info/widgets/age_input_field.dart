import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/presentation/view/auth/login/widgets/custom_text_field.dart';

class AgeInputField extends StatelessWidget {
  final TextEditingController controller;

  const AgeInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: CustomTextField(
        title: 'Age',
        controller: controller,
        prefix: SvgPicture.asset(kCalendar),
      ),
    );
  }
}
