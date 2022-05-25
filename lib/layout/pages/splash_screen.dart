import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash-screen';
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("img/logo_large.png"),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
