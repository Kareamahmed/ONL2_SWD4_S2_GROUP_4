import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:striky/core/constants/global_constants.dart';

class OnboardingContent extends StatelessWidget {
  final String image, title, description;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          fit: BoxFit.fitHeight,
          image,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: kprimaryfont)),
        ),
        const SizedBox(height: 10),
        Text(description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontFamily: kprimaryfont)),
      ],
    );
  }
}
