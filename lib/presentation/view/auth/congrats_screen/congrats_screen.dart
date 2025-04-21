import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/presentation/view/auth/widgets/customSmallButton.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: SvgPicture.asset(kCongrats),
          ),
          Spacer(),
          Customsmallbutton(
              title: 'done',
              onTap: () {
                GoRouter.of(context).push(AppRoutes.setInfo);
              }),
        ],
      ),
    );
  }
}
