import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/routes/go_route.dart';
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
            children: [
              Text(
                'Your Name',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: kprimaryfont),
              ),
              InkWell(
                onTap: () {
                  //GoRouter.of(context).push(AppRoutes.);
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRoutes.notificationView);
                      },
                      child: custom.IconButton(Icons.notifications)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
