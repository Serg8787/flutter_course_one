import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login"),
              TextFormField(validator: (value) {
                if (value!.isEmpty) return "Это поле не может быть пустым";
                if (value != "admin") return "Все правильно";
              }
               ),
              SizedBox(height: 15),
              Text("Пароль"),
              TextFormField(validator: (value) {
                if (value!.isEmpty) return "Это поле не может быть пустым";
                if (value != "12345") return "Все правильно";
              }
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Good")));

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
                      }
                    },
                    child: Center(
                      child: Text(
                        "Далі",
                        style: TextStyle(color: Colors.white),
                      ),

                    ),
                  ),
                  SizedBox(width: 5,),
                  Checkbox(
                    value: false, onChanged: (bool? value) {  },
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
