import 'package:flutter/material.dart';
import 'package:flutter_w1/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 51, 255, 33)),
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
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String _usernameErrorr = "Username at least 3 characters";
  String _passwordErrorr = "Password at least 6 characters";
  bool _userInvalid = false;
  bool _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.blueGrey),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FlutterLogo(
                  size: 30,
                ),
              ),
            ),
            Text(
              "Hello Welcome Back !!!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "USERNAME", errorText: _userInvalid ? _usernameErrorr: null),
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "PASSWORD", errorText: _passInvalid ? _passwordErrorr: null),
                  obscureText: !_showPass,
                ),
                GestureDetector(
                  onTap: onToggleShowPass,
                    child: Text(_showPass ? "HIDE" : "SHOW", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.blue), ))
              ]
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent), onPressed: buttonSignin, child: Text("SIGN IN", style: TextStyle(fontWeight: FontWeight.bold)),),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("NEW USER? SIGN UP", style: TextStyle(fontSize: 12, color: Color(0xff888888)),),
                  Text("FORGOT PASSWORD?", style: TextStyle(fontSize: 12, color: Colors.blue),),
                ],
              ),
          ],
        ),
      )
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void buttonSignin() {
    setState(() {
      if (_usernameController.text.length < 3) _userInvalid = true;
      else _userInvalid = false;
      if (_passwordController.text.length < 6) _passInvalid = true;
      else _passInvalid = false;

      if (!_userInvalid && !_passInvalid) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }

    });
  }
}

