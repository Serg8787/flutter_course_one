import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_course_one/screens/login_screen.dart';
import 'package:flutter_course_one/screens/welcome_dart.dart';

import 'PreferenceService.dart';

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
  final _preferenceService = PreferenceService();

  Future<bool> getBoolValues() async {
    bool value = await _preferenceService.getData();
    return value;
  }



  @override
  initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();


    getBoolValues().then((value) => (){
      print("start + $value");
    });
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => LoginScreen()));
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
