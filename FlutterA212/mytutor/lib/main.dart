import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mytutor/views/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY Tutor',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MySplashScreen(title: 'MY Tutor'),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key, required String title}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (contents) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splashscreentutor.png'),
                    fit: BoxFit.cover)),
          ),
          /*const Align(
            alignment: Alignment(-0.75, -0.05),
            child: Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          const Align(
            alignment: Alignment(-0.70, 0.10),
            child: Text(
              'MY Tutor',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
