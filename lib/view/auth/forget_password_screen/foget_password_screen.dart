import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/view/auth/forget_password_screen/widget/custom_container.dart';
import 'package:striky/view/auth/widgets/customSmallButton.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                ),
                child: SvgPicture.asset(
                  kIconBack,
                  width: 60,
                ),
              ),
              Text(
                'Forget Password?',
                style: TextFonts.kwhiteboldfont25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    'Select which contact details should we use to reset your password',
                    style: TextFonts.kwhitenormalfont12),
              ),
              CustomContainer(
                title: 'Via sms:',
                leadingIcon: kemail,
                subtitle: kgmailexample,
              ),
              CustomContainer(
                title: 'Via email:',
                leadingIcon: kmessage,
                subtitle: ksmsexample,
              ),
              Spacer(),
              Customsmallbutton(
                title: 'Next',
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.otpPage);
                },
              ),
            ],
          ),
        ));
  }
}
