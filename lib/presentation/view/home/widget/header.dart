import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/presentation/view/home/widget/icon_button.dart'
    as custom;
import 'package:striky/presentation/view/profile/widgets/custom_switch.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Welcome Back,',
              style:
                  TextStyle(color: Colors.black54, fontFamily: kprimaryfont)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Ana',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: kprimaryfont),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSwitch(isOn: false, onToggle: () {}),
              Row(
                children: [
                  custom.IconButton(Icons.search),
                  const SizedBox(width: 10),
                  custom.IconButton(Icons.notifications),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
