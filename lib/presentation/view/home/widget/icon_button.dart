import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final IconData icon;
  const IconButton(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Icon(icon, size: 20),
    );
  }
}
