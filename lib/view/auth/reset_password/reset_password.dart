import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';

import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/view/auth/widgets/customSmallButton.dart';
import 'package:striky/view/auth/widgets/custom_dark_text_field.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   TextEditingController controller1 = TextEditingController();
   TextEditingController controller2 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
                width: 250,
                child: Text('Reset your password here',style: TextFonts.kwhiteboldfont25,)),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Select which contact details should we use to reset your password',style: TextFonts.kwhitenormalfont12,),
                ),
              ),
                
            
                CustomDarkTextField(controller: controller1, title: 'New Password',),
                CustomDarkTextField(controller: controller2, title: 'Confirm Password',),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 20.0, top: 40),
                   child: Customsmallbutton(
                    title: 'Next',
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.otpPage);
                    },
                                   ),
                 ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
