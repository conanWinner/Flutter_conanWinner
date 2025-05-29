import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/features/detail/view/detail_page.dart';
import 'package:flutter_w1/features/home/home.dart';
import 'package:flutter_w1/features/login/login.dart';
import 'package:flutter_w1/features/signup/cubit/signup_cubit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _showPass = false;
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  child: SizedBox.expand(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Image.asset("assets/images/BG.png"),
                    ),
                  ),
                ),
                Image.asset("assets/images/icon_signin.png", height: 50),
              ],
            ),

            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                        Text(
                          "Enter your credentials to continue",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff7C7C7C),
                            fontWeight: FontWeight.w200,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff030303),
                        fontWeight: FontWeight.w200,
                      ),
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff030303),
                        fontWeight: FontWeight.w200,
                      ),
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff030303),
                        fontWeight: FontWeight.w200,
                      ),
                      controller: _userNameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        return TextField(
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff030303),
                            fontWeight: FontWeight.w200,
                          ),
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            errorText:
                                state.emailError.isNotEmpty
                                    ? state.emailError
                                    : null,
                            labelStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff7C7C7C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        BlocBuilder<SignupCubit, SignupState>(
                          builder: (context, state) {
                            return TextField(
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff030303),
                                fontWeight: FontWeight.w200,
                              ),
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: "Password",
                                errorText:
                                    state.emailError.isNotEmpty
                                        ? state.emailError
                                        : null,

                                errorMaxLines: 2,
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff7C7C7C),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              obscureText: !_showPass,
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: onToggleShowPass,
                          child:
                              _showPass
                                  ? Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Color(0xff7C7C7C),
                                  )
                                  : Image.asset(
                                    "assets/images/hidden.png",
                                    height: 20,
                                  ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        text: 'By continuing you agree to our  ',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          color: Color(0xff7C7C7C),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: Color(0xff53B175)),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: TextStyle(color: Color(0xff53B175)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF53B175),
                          ),
                          onPressed:
                              !state.disableButton
                                  ? () {
                                    context.read<SignupCubit>().login(
                                      _emailController.text,
                                      _passwordController.text,
                                    );
                                  }
                                  : null,
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFFF9FF),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff030303),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF53B175),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
