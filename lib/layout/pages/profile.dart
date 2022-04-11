
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
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      drawer: const DrawerMenu(),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
                width: 190.0,
                height: 190.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "img/grid4.jpg")
                    )
                )),
                Column(
                  children : const [
                    ProfileRow(rowTitle: "Pseudo", rowData: "ChopperFlame"),
                    ProfileRowDivider(),

                    ProfileRow(rowTitle: "Email", rowData: "ChopperFlame@gmail.com"),
                    ProfileRowDivider(),

                    ProfileRow(rowTitle: "Pseudo", rowData: "ChopperFlame"),
                    ProfileRowDivider(),

                    ProfileRow(rowTitle: "Pseudo", rowData: "ChopperFlame"),
                    ProfileRowDivider(),

                    ProfileRow(rowTitle: "Pseudo", rowData: "ChopperFlame"),
                    ProfileRowDivider(),
                  ]
                )
              ],
        )
    );
  }
}