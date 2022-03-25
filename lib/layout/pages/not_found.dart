
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class NotFound extends StatelessWidget {
  static String routeName = '/404';
  const NotFound();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body:
      Text('Error 404 : Not Found'),
    );

  }
}