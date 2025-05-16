import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/presentation/view/auth/login/widgets/main_custom_button.dart';

class SetGoal extends StatefulWidget {
  const SetGoal({super.key});

  @override
  State<SetGoal> createState() => _SetGoalState();
}

class _SetGoalState extends State<SetGoal> {
  late PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Text(
              'What is your goal ?',
              textAlign: TextAlign.center,
              style: TextFonts.kwhiteboldfont25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                'It will help us to Choose the best Program for you!',
                style: TextFonts.kwhitenormalfont12,
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageViewController,
                children: [
                  SvgPicture.asset(kCardGoals1),
                  SvgPicture.asset(kCardGoals2),
                  SvgPicture.asset(kCardGoals3),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MainCustomButton(
                title: 'Confirm',
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.setInfo,
                      extra: _pageViewController.page == 0
                          ? 'Improve Shape'
                          : _pageViewController.page == 1
                              ? 'Lean & Tone'
                              : 'Lose a Fat');
                },
              ),
            ),
          ],
        ));
  }
}
