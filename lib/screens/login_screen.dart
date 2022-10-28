import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course_one/PreferenceService.dart';
import 'package:flutter_course_one/screens/welcome_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isCheckedCheckBox = false;


  final _preferenceService = PreferenceService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Authorization',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Login',
                    suffixIcon: Icon(Icons.login),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.password),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 300,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (nameController.text == "admin" &&
                            passwordController.text == "12345") {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Welcome()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content:
                                  Text("Login and password are not correct")));
                        }
                      },
                    ),
                  ),
                  Container(
                    child: Checkbox(
                        value: isCheckedCheckBox,
                        onChanged: (newBool) async {
                          setState(() {
                            isCheckedCheckBox = newBool;
                          });
                          if(isCheckedCheckBox ==true &&
                              nameController.text == "admin"&&
                          passwordController.text=="12345"){
                            _preferenceService.setData(isCheckedCheckBox!);
                            print(_preferenceService.setData(isCheckedCheckBox!));
                           _preferenceService.setData(isCheckedCheckBox!).then((value) =>
                           print("login + $isCheckedCheckBox"));
                          }
                        }),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
