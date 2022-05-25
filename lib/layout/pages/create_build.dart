import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class CreateBuild extends StatelessWidget {
  static const String routeName = '/create-build';
  const CreateBuild();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Text('BUILD CREATION PAGE'),
    );
  }
}
