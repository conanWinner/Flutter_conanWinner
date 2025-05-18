import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_w1/detail.dart';
import 'package:flutter_w1/signin.dart';

void main() {
  runApp(const Signup());
}

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 51, 255, 33),
        ),
      ),
      home: const MyHomePage(title: 'conanWinner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showPass = false;
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String _emailErrorr = "Please enter a valid email format!";
  String _passwordErrorr =
      "Password must be at least 6 characters with 1 uppercase letter, 1 lowercase letter, and 1 number.";
  bool _emailInvalid = false;
  bool _passInvalid = false;

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
                Image.asset("assets/images/icon_signin.png", height: 50,),
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
                              MaterialPageRoute(builder: (context) => MyApp()),
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
                          style: TextStyle(fontSize: 16, color: Color(0xff7C7C7C), fontWeight: FontWeight.w200),
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
                          fontWeight: FontWeight.w200
                      ),
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: "First Name", labelStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w600
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff030303),
                          fontWeight: FontWeight.w200
                      ),
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: "Last Name", labelStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w600
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff030303),
                          fontWeight: FontWeight.w200
                      ),
                      controller: _userNameController,
                      decoration: InputDecoration(labelText: "Username", labelStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w600
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff030303),
                          fontWeight: FontWeight.w200
                      ),
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        errorText: _emailInvalid ? _emailErrorr : null,
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff7C7C7C),
                              fontWeight: FontWeight.w600
                          )
                      ),
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
                              color: Color(0xff030303),
                              fontWeight: FontWeight.w200
                          ),
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            errorText: _passInvalid ? _passwordErrorr : null,
                            errorMaxLines: 2,
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff7C7C7C),
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          obscureText: !_showPass,
                        ),
                        GestureDetector(
                          onTap: onToggleShowPass,
                          child:  _showPass ? Icon(Icons.remove_red_eye_outlined, color: Color(0xff7C7C7C),) : Image.asset("assets/images/hidden.png", height: 20,),

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
                          TextSpan(text: 'Terms of Service', style: TextStyle(color: Color(0xff53B175))),
                          TextSpan(text: ' and '),
                          TextSpan(text: 'Privacy Policy.', style: TextStyle(color: Color(0xff53B175))),
                        ],
                      ),
                    )
                  ),

                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF53B175),
                      ),
                      onPressed: buttonSignup,
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff030303),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
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
            )

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

  void buttonSignup() {
    setState(() {
      if (!validateEmail(_emailController.text))
        _emailInvalid = true;
      else
        _emailInvalid = false;
      if (!validatePassword(_passwordController.text))
        _passInvalid = true;
      else
        _passInvalid = false;

      if (!_emailInvalid && !_passInvalid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      }
    });
  }

  bool validateEmail(String email) {
    if (!email.contains("@")) return false;
    var tmp = email.split("@");
    if (tmp[0].length < 2) return false;
    return true;
  }

  bool validatePassword(String password) {
    int up = 0;
    int low = 0;
    int num = 0;
    if (password.length < 6) return false;
    var value = password.codeUnits;
    for (int i = 0; i < value.length; i++) {
      if (value[i] >= 'A'.codeUnits.first && value[i] <= 'Z'.codeUnitAt(0))
        up++;
      if (value[i] >= 'a'.codeUnits.first && value[i] <= 'z'.codeUnits.first)
        low++;
      if (value[i] >= 0 && value[i] <= 9) num++;
    }

    if (up == 0 || low == 0 || num == 0) return false;

    return true;
  }
}
