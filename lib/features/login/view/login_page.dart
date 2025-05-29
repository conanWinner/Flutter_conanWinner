import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/features/login/cubit/login_cubit.dart';
import 'package:flutter_w1/features/signup/signup.dart';
import 'package:flutter_w1/features/login/login.dart';
import 'package:flutter_w1/core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPagePageState();
}

class _LoginPagePageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            final loginCubit = context.read<LoginCubit>();

            return Stack(
              children: [
                ListView(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 150,
                          child: SizedBox.expand(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 50,
                                sigmaY: 50,
                              ),
                              child: Image.asset("assets/images/BG.png"),
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/icon_signin.png",
                          height: 50,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Log in",
                                  style: TextStyle(
                                    color: Color(0xff181725),
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "Enter your emails and password",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7C7C7C),
                                    fontWeight: FontWeight.w100,
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
                                color: Color(0xff181725),
                                fontWeight: FontWeight.w200,
                              ),
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff7C7C7C),
                                  fontWeight: FontWeight.w500,
                                ),
                                labelText: "Email",
                                errorText:
                                    state.emailError.isNotEmpty
                                        ? state.emailError
                                        : null,
                                errorMaxLines: 2,
                              ),
                              onChanged: (value) {
                                loginCubit.onchangeEmail(value);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                TextField(
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff181725),
                                    fontWeight: FontWeight.w200,
                                  ),
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff7C7C7C),
                                    ),
                                    labelText: "Password",
                                    errorText:
                                        state.passwordError.isNotEmpty
                                            ? state.passwordError
                                            : null,
                                    errorMaxLines: 3,
                                  ),
                                  obscureText: !_showPass,
                                  onChanged: (value) {
                                    loginCubit.onchangePassword(value);
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
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff7C7C7C),
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),

                          SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF53B175),
                              ),
                              onPressed:
                                  !state.disableButton
                                      ? () {
                                        loginCubit.login(
                                          _emailController.text,
                                          _passwordController.text,
                                        );
                                      }
                                      : null,
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFF9FF),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account? ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff181725),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(context, "/signup");
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff53B175),
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

                    Stack(
                      children: [
                        Container(
                          height: 160,
                          child: SizedBox.expand(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 80,
                                sigmaY: 80,
                              ),
                              child: Image.asset("assets/images/BG.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                state.loading ? LoadingOverlay() : const SizedBox.shrink(),
              ],
            );
          },
          listener: (context, state) {
            if (state.isLoginSuccess) {
              Navigator.pushReplacementNamed(context, '/navigate');
            }
          },
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
