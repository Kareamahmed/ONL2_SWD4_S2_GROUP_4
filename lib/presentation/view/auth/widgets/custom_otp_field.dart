import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({
    super.key,
    required this.otpPinFieldKey,
  });
  final GlobalKey<OtpPinFieldState> otpPinFieldKey;

  @override
  Widget build(BuildContext context) {
    return OtpPinField(
      key: otpPinFieldKey,
      onSubmit: (vlaue) {
        print('onSubmit is $vlaue');
      },
      onChange: (value) {
        print('onChange is $value');
      },
      onCodeChanged: (code) {
        print('onCodeChanged  is $code');
      },
      otpPinFieldStyle: OtpPinFieldStyle(
        showHintText: true,
        activeFieldBorderGradient: LinearGradient(
            colors: [Colors.black, Colors.redAccent, Colors.orangeAccent]),
        filledFieldBorderGradient:
            LinearGradient(colors: [Colors.green, Colors.tealAccent]),
        defaultFieldBorderGradient:
            LinearGradient(colors: [Colors.orange, Colors.brown]),
      ),
      maxLength: 4,
      showCursor: true,
      cursorColor: Color(0xffFFF500),
      mainAxisAlignment: MainAxisAlignment.center,
      otpPinFieldDecoration: OtpPinFieldDecoration.roundedPinBoxDecoration,
    );
  }
}
