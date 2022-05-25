
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

import '../partials/drawer_menu.dart';

class ListBuild extends StatelessWidget {
  static const  String routeName = '/list-build';
  const ListBuild();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: const CustomAppBar(),
        drawer: const DrawerMenu(),
        body:
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child:
          ListView(
            children:  const [
              Text(
                  'LIST BUILD',
                  style: TextStyle(color: Colors.white),
              ),
              BuildCard(
                  buildImage: "img/build_image.png",
                  buildStats: "STR / INT",
                  buildTitle: "Mad pyromancer",
                  buildDescription: "Some great descritpion",
                  buildId: 1),
              BuildCard(
                  buildImage: "img/build_image.png",
                  buildStats: "STR / INT",
                  buildTitle: "Mad faith man",
                  buildDescription: "Some great descritpion",
                  buildId: 2),
              BuildCard(
                  buildImage: "img/build_image.png",
                  buildStats: "STR / INT",
                  buildTitle: "Sane alchemist",
                  buildDescription: "Some great descritpion",
                  buildId: 3),
              BuildCard(
                  buildImage: "img/build_image.png",
                  buildStats: "STR / INT",
                  buildTitle: "Bonk dude",
                  buildDescription: "Some great descritpion",
                  buildId: 4),
              BuildCard(
                  buildImage: "img/build_image.png",
                  buildStats: "STR / INT",
                  buildTitle: "Wizard man",
                  buildDescription: "Some great descritpion",
                  buildId: 5),
              ]
          ),
      )
    );

  }
}