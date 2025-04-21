import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildLoading extends StatelessWidget {
  const BuildLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.white24,
          highlightColor: Colors.white,
          child: Container(
            width: 240,
            height: 240,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Loading your steps...",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
