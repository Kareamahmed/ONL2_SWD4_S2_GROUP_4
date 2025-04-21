import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/presentation/view/auth/login/widgets/clicked_text.dart';
import 'package:striky/presentation/view/auth/widgets/customBigButton.dart';
import 'package:striky/presentation/view/auth/login/widgets/custom_text_field.dart';
import 'package:striky/presentation/view/auth/login/widgets/main_custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: Column(children: [
          Text(
              textAlign: TextAlign.center,
              'Hey there,',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: kprimaryfont,
              )),
          Text(
              textAlign: TextAlign.center,
              'Welcome Back',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: kprimaryfont,
              )),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: emailController,
            prefix: SvgPicture.asset(
              kemailprefix,
            ),
            title: 'Email',
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: passwordController,
            prefix: SvgPicture.asset(
              klock,
            ),
            title: 'Password',
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: kprimaryfont,
                fontSize: 16,
              ),
            ),
          ),
          Spacer(),
          MainCustomButton(
            onPressed: () {},
            title: 'Login',
            preIcon: SvgPicture.asset(
              kloginmark,
            ),
          ),
          Center(
            child: Text(
              'Or Continue With',
              style: TextStyle(
                color: Colors.white,
                fontFamily: kprimaryfont,
                fontSize: 16,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ImagedButton(
              title: 'Google',
              img: kgoogle,
              onTap: () {},
            ),
            ImagedButton(
              title: 'Facebook',
              img: kfacebook,
              onTap: () {},
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: Colors.white,
                fontFamily: kprimaryfont,
                fontSize: 16,
              ),
            ),
            ClickedText(
                title: ' Register',
                onpressed: () {
                  GoRouter.of(context).push(AppRoutes.createaccount);
                }),
          ])
        ]),
      ),
    );
  }
}
