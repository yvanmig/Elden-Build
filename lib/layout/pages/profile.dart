
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(160, 141, 106, 1.0),
          title: const Center(
              child: Text('Elden Build')
          ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_sharp),
            tooltip: 'User Profile',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
      ),
      body:
      const Text('PROFILE'),
      drawer: const DrawerMenu()
    );

  }
}