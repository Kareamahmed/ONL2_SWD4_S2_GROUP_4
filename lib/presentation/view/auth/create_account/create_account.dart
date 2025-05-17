import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/presentation/cubits/auth/register1/register1_cubit.dart';
import 'package:striky/presentation/view/auth/widgets/customBigButton.dart';
import 'package:striky/presentation/view/auth/login/widgets/custom_text_field.dart';
import 'package:striky/presentation/view/auth/login/widgets/main_custom_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool termsAccepted = false;
  String sharedId = '';

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onRegisterPressed(BuildContext context) {
    if (_formKey.currentState!.validate() && termsAccepted) {
      context.read<Register1Cubit>().register(
            emailController.text.trim(),
            passwordController.text.trim(),
            firstNameController.text.trim(),
            lastNameController.text.trim(),
          );
    } else if (!termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must accept the Privacy Policy and Terms of Use.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Force the first letter of the email to be capitalized
  void _capitalizeFirstLetterOfEmail() {
    final email = emailController.text.trim();
    if (email.isNotEmpty) {
      emailController.text = email[0].toUpperCase() + email.substring(1);
      emailController.selection = TextSelection.fromPosition(
          TextPosition(offset: emailController.text.length));
    }
  }

  // Validate the password to check for special characters, numbers, and capital letters
  String? _validatePassword(String? password) {
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(password!)) {
      return 'Password must contain at least one capital letter, one number, and one special character.';
    }
    return null;
  }

  // Save the ID in SharedPreferences
  Future<void> _saveUserIdToSharedPreferences(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kshareduserId, userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text('Hey there,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: kprimaryfont,
                    )),
                Text('Create an Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: kprimaryfont,
                    )),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: firstNameController,
                  prefix: SvgPicture.asset(kprofile),
                  title: 'First Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: lastNameController,
                  prefix: SvgPicture.asset(kprofile),
                  title: 'Last Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: emailController,
                  prefix: SvgPicture.asset(kemailprefix),
                  title: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (_) =>
                      _capitalizeFirstLetterOfEmail(), // Capitalize the first letter
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
                  prefix: SvgPicture.asset(klock),
                  title: 'Password',
                  obscureText: true,
                  validator: _validatePassword, // Validate the password
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          termsAccepted = value!;
                        });
                      },
                      activeColor: kprimaryColor,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: kprimaryfont,
                            fontSize: 16,
                          ),
                          children: const [
                            TextSpan(text: 'By continuing you accept our '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                BlocConsumer<Register1Cubit, Register1State>(
                  listener: (context, state) async {
                    if (state is Register1Success) {
                      // Show a success message with Flushbar
                      Flushbar(
                        message: "✅ Here is your ID: ${state.userId}",
                        duration: Duration(seconds: 3),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Colors.green,
                      ).show(context);

                      // Save user ID to SharedPreferences
                      await _saveUserIdToSharedPreferences(state.userId);

                      // Navigate to the camera screen
                      GoRouter.of(context).replace(AppRoutes.setGoal);
                    } else if (state is Register1Failure) {
                      Flushbar(
                        message: state.errMsg,
                        duration: Duration(seconds: 3),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Colors.red,
                      ).show(context);
                    }
                  },
                  builder: (context, state) {
                    if (state is Register1Loading) {
                      return const CircularProgressIndicator();
                    }

                    if (state is Register1Failure) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(state.errMsg,
                            style: const TextStyle(color: Colors.red)),
                      );
                    }

                    if (state is Register1Success) {
                      // 👇 Print the full success state (or specific fields)
                      print("✅ Register1Success: ${state.toString()}");
                      print("✅ Register1Success  ID: ${state.userId}");

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Registration successful!',
                          style: TextStyle(color: Colors.green),
                        ),
                      );
                    }

                    return MainCustomButton(
                      onPressed: () => _onRegisterPressed(context),
                      title: 'Register',
                      preIcon: SvgPicture.asset(kloginmark),
                    );
                  },
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ImagedButton(
                    title: 'Google',
                    img: kgoogle,
                    onTap: () {
                      // TODO: Implement Google Auth
                    },
                  ),
                  ImagedButton(
                    title: 'Facebook',
                    img: kfacebook,
                    onTap: () {
                      // TODO: Implement Facebook Auth
                    },
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
