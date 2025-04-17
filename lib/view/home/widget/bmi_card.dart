import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BMICard extends StatelessWidget {
  const BMICard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff92A3FD), Color(0xff9DCEFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BMI (Body Mass Index)',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'You have a normal weight',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffC58BF2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('View More'),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 106,
                  width: 106,
                  child: SvgPicture.asset(
                    'assets/imgs/bannerpie.svg',
                    fit: BoxFit.fill
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
