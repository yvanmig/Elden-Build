
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class Register extends StatelessWidget {
  static String routeName = '/register';
  const Register();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: const [
              Image(
                height: 230,
                image: NetworkImage('img/logo.png'),
              ),
              Text(
                  'Elden rinG',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40
                  )
              ),
              const Text(
                  'RegisteR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  )
              ),
            ],
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Pseudo',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Confirm password',
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              FormButton(buttonText: "REGISTER", route: "/REGISTER"),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "You already have an account ?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: ' log in',
                      style: const TextStyle(color: Colors.blueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, "/login");
                        },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

  }
}