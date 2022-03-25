
import 'package:elden_build/layout/partials/drawer_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class Profile extends StatelessWidget {
  static String routeName = '/profile';
  const Profile();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(),
      body:
      Text('PROFILE'),
      drawer: DrawerMenu()
    );

  }
}