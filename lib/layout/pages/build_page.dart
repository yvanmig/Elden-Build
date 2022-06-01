import 'package:elden_build/layout/partials/build/equipment.dart';
import 'package:elden_build/layout/partials/build/stat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';
import '../../model/EquipmentModel.dart';

class BuildPage extends StatelessWidget {
  static const String routeName = '/build-page';
  final String buildDescription =
      "A build using faith and dexterity to annihilate waves of ennemies. May stagger bosses if combined with a high level talisman";
  final String name;
  final int id;

  final List<EquipmentModel> weapons = [
    EquipmentModel(id: "1", image: "img/equipments/weapons/crystal_staff.png", name: "Crystal staff"),
    EquipmentModel(id: "2", image: "img/equipments/weapons/golden_order_greatsword.png", name: "Golden order greatsword"),
    EquipmentModel(id: "3", image: "img/equipments/weapons/night_sword.png", name: "Night sword"),
    EquipmentModel(id: "4", image: "img/equipments/weapons/twinblade.png", name: "Moonblade"),
  ];
  final List<EquipmentModel> spells = [
    EquipmentModel(id: "200", image: "img/equipments/spells/elden_stars.png", name: "Elden Stars"),
    EquipmentModel(id: "201", image: "img/equipments/spells/moonblade.png", name: "Moon blade"),
    EquipmentModel(id: "202", image: "img/equipments/spells/comet.png", name: "Azur comet"),
    EquipmentModel(id: "203", image: "img/equipments/spells/lightning_spear.png", name: "Lightning spear"),
  ];

  final List<EquipmentModel> talismans = [
    EquipmentModel(id: "401", image: "img/equipments/talismans/flock.png", name: "Flock canvas"),
    EquipmentModel(id: "402", image: "img/equipments/talismans/jump.png", name: "Jump attack"),
    EquipmentModel(id: "403", image: "img/equipments/talismans/dragon.png", name: "Dragoncrest shield"),
    EquipmentModel(id: "404", image: "img/equipments/talismans/branch.png", name: "Sacred branch"),
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
                          return SizedBox(
                            width: 80,
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
                        child: Text(buildDescription, style: const TextStyle(color: Colors.white)),
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
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: weapons.map((weapon) {
                                    var equipmentImage = Helpers.findById(weapons, weapon.id).image;
                                    var imgWeapon = weapons.where((element) => element.id == weapon.id);
                                    return Equipment(
                                        name: weapon.name,
                                        image: equipmentImage);
                                  }).toList()),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: spells.map((spell) {
                                    var equipmentImage = Helpers.findById(spells, spell.id).image;
                                    return Container(
                                      child: Equipment(
                                          name: spell.name,
                                          image: equipmentImage),
                                    );
                                  }).toList()),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: talismans.map((talisman) {
                                    var equipmentImage = Helpers.findById(talismans, talisman.id).image;
                                    return Equipment(
                                        name: talisman.name,
                                        image:equipmentImage);
                                  }).toList()),
                            ])),
                        Container(
                          child: TabBar(
                            tabs: [
                              const Tab(
                                child: Text("Weapon"),
                              ),
                              const Tab(
                                child: Text("Spells"),
                              ),
                              const Tab(
                                child: Text("Talismans"),
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
class Helpers {
  static findById(list, String id) {
    var findById = (obj) => obj.id == id;
    var result = list.where(findById);
    return result.length > 0 ? result.first : null;
  }
}