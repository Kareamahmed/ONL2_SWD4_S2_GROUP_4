import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/view/intro_pages/on_boarding_pages/on_boarding_context.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: konboardingData.length,
            itemBuilder: (context, index) => OnboardingContent(
              image: konboardingData[index]["image"]!,
              title: konboardingData[index]["title"]!,
              description: konboardingData[index]["description"]!,
            ),
          ),
          GestureDetector(
              onTap:   () {
                          if (_currentIndex >= konboardingData.length - 1) {
                            Future.delayed(const Duration(milliseconds: 200),
                                () {
                              GoRouter.of(context).push(AppRoutes.login);
                            });
                          } else {
                            _controller.animateToPage(
                              _currentIndex + 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          }
                        },
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: kprimaryColor,
                        child:  Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                      
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: kprimaryColor,
                          value: (_currentIndex / konboardingData.length) + 0.25,
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
