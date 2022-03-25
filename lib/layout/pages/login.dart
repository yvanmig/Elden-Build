
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class Login extends StatelessWidget {
  static String routeName = '/login';
  const Login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Image(
            height: 230,
            image: NetworkImage('img/logo.png'),
          ),
          Text(
              'Elden rinG',
              style: TextStyle(
                color: Colors.white,
              )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 75, vertical: 8),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
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
        ],
      ),
    );

  }
}