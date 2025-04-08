import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/view/auth/widgets/customSmallButton.dart';
import 'package:striky/view/auth/widgets/custom_otp_field.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
      final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 70.0, top: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(kotpRatingphoto),
          ],
        ),
      ),
      Text(
        'OTP Verification',
        style: TextStyle(
          fontFamily: kprimaryfont,
          color: Color(0xffFFF500),
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "We will send you a one-time password on this ",
            style: TextStyle(
              fontFamily: kprimaryfont,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: 'Mobile Number',
                style: TextStyle(
                  fontFamily: kprimaryfont,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
      Text(
        '+60 - 122294235',
        style: TextFonts.kwhiteboldfont25.copyWith(fontSize: 20),
      ),
      SizedBox(
        height: 100,
        child: CustomOtpField(otpPinFieldKey: _otpPinFieldController),
      ),
      Customsmallbutton(title: 'Verify', onTap: () {
                  GoRouter.of(context).push(AppRoutes.congratsScreen);
      }),
    ],
  ),
),

    );
  }
}
