import 'package:elden_build/layout/partials/build/equipment.dart';
import 'package:elden_build/layout/partials/build/stat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class BuildPage extends StatelessWidget {
  static const String routeName = '/build-page';
  final String buildDescription =
      "A build using faith and dexterity to annihilate waves of ennemies. May stagger bosses if combined with a high level talisman";
  final String name;
  final int id;

  final List<Equipment> weapons = [
    const Equipment(image: "img/sword.png", name: "Oath Keeper"),
    const Equipment(image: "img/sword.png", name: "Sword of night"),
    const Equipment(image: "img/sword.png", name: "Sword of magic"),
  ];
  final List<Equipment> spells = [
    const Equipment(image: "img/sword.png", name: "Elden Stars"),
    const Equipment(image: "img/sword.png", name: "Big hurty laser"),
    const Equipment(image: "img/sword.png", name: "Lightning Spear"),
    const Equipment(image: "img/sword.png", name: "Golden Vow"),
  ];
  final List<Equipment> talismans = [
    const Equipment(image: "img/sword.png", name: "Dirty tissue"),
    const Equipment(image: "img/sword.png", name: "Cloth canvas"),
    const Equipment(image: "img/sword.png", name: "Lightning Spear"),
    const Equipment(image: "img/sword.png", name: "Cloth canvas"),
  ];
  final List<Stat> stats = [
    const Stat(value: 37, name: "INT"),
    const Stat(value: 37, name: "INT"),
    const Stat(value: 37, name: "INT"),
    const Stat(value: 37, name: "INT"),
    const Stat(value: 37, name: "INT"),
    const Stat(value: 37, name: "INT"),
    const Stat(value: 37, name: "INT"),
  ];

  BuildPage({Key? key, required this.name, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBarBuild(buildName: name),
      body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 175,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: stats.map((stat) {
                          return Container(
                            child: Stat(value: stat.value, name: stat.name),
                          );
                        }).toList()),
                    // const Padding(padding: const EdgeInsets.only(bottom: 20)),
                    Align(
                      widthFactor: 0.7,
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.all(10),
                        child: const VerticalDivider(
                          color: Color.fromRGBO(160, 141, 106, 1.0),
                          thickness: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 75),
                        child: Text(buildDescription, style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
              DefaultTabController(
                  length: 3, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                            height: 360, //height of TabBarView
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color:
                                            Color.fromRGBO(160, 141, 106, 1.0),
                                        width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              Container(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: weapons.map((weapon) {
                                        return Container(
                                          child: Equipment(
                                              name: weapon.name,
                                              image: weapon.image),
                                        );
                                      }).toList())),
                              Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: spells.map((spell) {
                                      return Container(
                                        child: Equipment(
                                            name: spell.name,
                                            image: spell.image),
                                      );
                                    }).toList()),
                              ),
                              Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: talismans.map((talismans) {
                                      return Container(
                                        child: Equipment(
                                            name: talismans.name,
                                            image: talismans.image),
                                      );
                                    }).toList()),
                              ),
                            ])),
                        Container(
                          child: TabBar(
                            tabs: [
                              Tab(
                                child: Container(
                                  child: const Text("Weapon"),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  child: const Text("Spells"),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  child: const Text("Talismans"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])),
            ],
          ),
        ));
  }
}
