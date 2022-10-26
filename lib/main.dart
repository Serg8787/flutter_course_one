import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_course_one/screens/login_screen.dart';
import 'package:flutter_course_one/screens/welcome_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
    bool? admin = preferences.getBool("admin");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();

    Timer(Duration(seconds: 3), () {
      if (preferences.getBool("admin") == true) {
        print(preferences.getBool("admin"));
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => Welcome()));
      } else {
        print(preferences.getBool("admin"));
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Сделать на весь экран

        child: Image.asset("assets/images/flutter.png"),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
