import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool isOn;
  final VoidCallback onToggle;

  const CustomSwitch({
    super.key,
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,  // Trigger onToggle when tapped
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 50,
        height: 25,
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isOn
              ? LinearGradient(
                  colors: [Colors.pinkAccent, Colors.purpleAccent],
                )
              : LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade400],
                ),
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 300),
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
