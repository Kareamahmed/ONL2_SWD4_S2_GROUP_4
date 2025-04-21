import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/routes/go_route.dart';


class BuildTodayTargetcard extends StatelessWidget {
  const BuildTodayTargetcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Today Target', style: TextStyle(fontSize: 16)),

          ElevatedButton(
            onPressed: () {GoRouter.of(context).push(AppRoutes.fitoverviewloader);},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff9DCEFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Check', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}