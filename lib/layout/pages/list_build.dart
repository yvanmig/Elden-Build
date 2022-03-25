
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class ListBuild extends StatelessWidget {
  static String routeName = '/list-build';
  const ListBuild();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body:
      Text('LIST BUILD'),
    );

  }
}