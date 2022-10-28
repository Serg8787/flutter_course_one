import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {


  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Wellcome",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),
        ),
      ),
    );
  }
}
