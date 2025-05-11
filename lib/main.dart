import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
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
              decoration: InputDecoration(labelText: "USERNAME"),
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "PASSWORD"),
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
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent), onPressed: null, child: Text("SIGN IN", style: TextStyle(fontWeight: FontWeight.bold)),),
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
}