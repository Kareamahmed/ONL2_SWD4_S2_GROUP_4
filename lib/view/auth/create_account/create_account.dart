import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/view/auth/login/widgets/clicked_text.dart';
import 'package:striky/view/auth/widgets/customBigButton.dart';
import 'package:striky/view/auth/login/widgets/custom_text_field.dart';
import 'package:striky/view/auth/login/widgets/main_custom_button.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(right: 20.0,
              left: 20.0, top: 50, bottom: 20),
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
                'Create an Account',
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
                kprofile,
              ),
              title: 'First Name',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: emailController,
              prefix: SvgPicture.asset(
                kprofile,
              ),
              title: 'Last Name',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: emailController,
              prefix: SvgPicture.asset(
                kemailprefix,
              ),
              title: 'Email',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: passwordController,
              prefix: SvgPicture.asset(
                klock,
              ),
              title: 'Password',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Checkbox(
      value: false,
      onChanged: (value) {},
      activeColor: kprimaryColor,
    ),
    Flexible(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontFamily: kprimaryfont,
            fontSize: 16,
          ),
          children: [
            TextSpan(text: 'By continuing you accept our '),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                decoration: TextDecoration.underline, // Underline this part
              ),
            ),
            TextSpan(text: ' and '),
            TextSpan(
              text: 'Terms of Use',
              style: TextStyle(
                decoration: TextDecoration.underline, // Underline this part
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),

            Spacer(),
            MainCustomButton(
              onPressed: (){
                //it's an example just to demonstrate the functionality 
                GoRouter.of(context).push(AppRoutes.forgetPasswordScreen);
              },
              title: 'Register',
              preIcon: SvgPicture.asset(
                kloginmark,
              ),
             
            ),
            
            Center(
              child: Text(
                'Or Register With',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: kprimaryfont,
                  fontSize: 16,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ImagedButton(title: 'Google', img: kgoogle, onTap: (){},),
              ImagedButton(title: 'Facebook', img: kfacebook, onTap: (){},),
            ]),
            
           
          ]),
        ),
        );
  }
}
