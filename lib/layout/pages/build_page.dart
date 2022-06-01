import 'package:elden_build/models/build_model.dart';
import 'package:elden_build/models/build_provider.dart';
import 'package:elden_build/models/spell_provider.dart';
import 'package:elden_build/models/talisman_provider.dart';
import 'package:elden_build/models/weapon_model.dart';
import 'package:elden_build/models/weapon_provider.dart';
import 'package:flutter/material.dart';
import 'package:elden_build/layout/layout.dart';
import '../../model/EquipmentModel.dart';
import 'package:provider/provider.dart';

import '../../models/spell_model.dart';
import '../../models/talisman_model.dart';

class BuildPage extends StatefulWidget {
  static const String routeName = '/build-page';
  final String name;
  final String? id;
  const BuildPage({Key? key, required this.name, this.id}) : super(key: key);

  @override
  State<BuildPage> createState() => _BuildPage();
}

class _BuildPage extends State<BuildPage> {
  late bool _isLoading;
  List<Weapon> weapons_provider = [];
  List<Spell> spells_provider = [];
  List<Talisman> talismans_provider = [];
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(
        const Duration(seconds: 3),
        () => {
              setState(() => {_isLoading = false})
            });
    super.initState();
    Provider.of<WeaponProvider>(context, listen: false).fetchData();
    Provider.of<SpellProvider>(context, listen: false).fetchData();
    Provider.of<TalismanProvider>(context, listen: false).fetchData();
  }

  final List<EquipmentModel> weapons = [
    EquipmentModel(
        id: "1",
        image: "img/equipments/weapons/crystal_staff.png",
        name: "Crystal staff"),
    EquipmentModel(
        id: "2",
        image: "img/equipments/weapons/golden_order_greatsword.png",
        name: "Golden order greatsword"),
    EquipmentModel(
        id: "3",
        image: "img/equipments/weapons/night_sword.png",
        name: "Night sword"),
    EquipmentModel(
        id: "4",
        image: "img/equipments/weapons/twinblade.png",
        name: "Moonblade"),
  ];
  final List<EquipmentModel> spells = [
    EquipmentModel(
        id: "200",
        image: "img/equipments/spells/elden_stars.png",
        name: "Elden Stars"),
    EquipmentModel(
        id: "201",
        image: "img/equipments/spells/moonblade.png",
        name: "Moon blade"),
    EquipmentModel(
        id: "202",
        image: "img/equipments/spells/comet.png",
        name: "Azur comet"),
    EquipmentModel(
        id: "203",
        image: "img/equipments/spells/lightning_spear.png",
        name: "Lightning spear"),
  ];

  final List<EquipmentModel> talismans = [
    EquipmentModel(
        id: "400",
        image: "img/equipments/talismans/flock.png",
        name: "Flock canvas"),
    EquipmentModel(
        id: "401",
        image: "img/equipments/talismans/jump.png",
        name: "Jump attack"),
    EquipmentModel(
        id: "402",
        image: "img/equipments/talismans/dragon.png",
        name: "Dragoncrest shield"),
    EquipmentModel(
        id: "403",
        image: "img/equipments/talismans/branch.png",
        name: "Sacred branch"),
  ];
  @override
  Widget build(BuildContext context) {
    Provider.of<BuildProvider>(context, listen: false).getBuild(widget.id as String);
    List<Build> currentBuild = Provider.of<BuildProvider>(context, listen: false).build;

    weapons_provider = Provider.of<WeaponProvider>(context, listen: false).weapons;
    spells_provider = Provider.of<SpellProvider>(context, listen: false).spells;
    talismans_provider = Provider.of<TalismanProvider>(context, listen: false).talismans;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBarBuild(buildName: widget.name),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
          child: _isLoading
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Image(
                      height: 230,
                      image: NetworkImage('img/logo.png'),
                    ),
                    Text('Elden rinG',
                        style: TextStyle(color: Colors.white, fontSize: 40)),
                    Text('LoadinG',
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ],
                ))
              : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 175,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 80,
                                child: Stat(
                                    value: currentBuild[0].vigor, name: "VIG")),
                            SizedBox(
                              width: 80,
                              child: Stat(
                                  value: currentBuild[0].mind, name: "MIND"),
                            ),
                            SizedBox(
                              width: 80,
                              child: Stat(
                                  value: currentBuild[0].endurence,
                                  name: "END"),
                            ),
                            SizedBox(
                              width: 80,
                              child: Stat(
                                  value: currentBuild[0].strength, name: "STR"),
                            ),
                            SizedBox(
                              width: 80,
                              child: Stat(
                                  value: currentBuild[0].dexterity,
                                  name: "DEX"),
                            ),
                            SizedBox(
                              width: 80,
                              child: Stat(
                                  value: currentBuild[0].intelligence,
                                  name: "INT"),
                            ),
                            SizedBox(
                              width: 80,
                              child: Stat(
                                  value: currentBuild[0].arcane, name: "ARC"),
                            ),
                            SizedBox(
                              width: 80,
                              child: Stat(
                                  value: currentBuild[0].faith, name: "FAITH"),
                            ),
                          ]),
                    ),
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
                        child: Text(currentBuild[0].description,
                            style: const TextStyle(color: Colors.white)),
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
                                  children: [
                                    // getWeaponWidget(weapons_provider),
                                    Container(
                                        child:
                                        currentBuild[0].weapon1 != 0
                                            ? Equipment(
                                            name: Helpers.findByIdInt(
                                                weapons_provider,
                                                currentBuild[0]
                                                    .weapon1)
                                                .name,
                                            image: Helpers.findByIdInt(
                                                weapons_provider,
                                                currentBuild[0]
                                                    .weapon1)
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].weapon2 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findByIdInt(
                                                weapons_provider,
                                                currentBuild[0]
                                                    .weapon2)
                                                .name,
                                            image: Helpers.findByIdInt(
                                                weapons_provider,
                                                currentBuild[0]
                                                    .weapon2)
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].weapon3 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findByIdInt(
                                                weapons_provider,
                                                currentBuild[0].weapon3)
                                                .name,
                                            image: Helpers.findByIdInt(
                                                weapons_provider,
                                                currentBuild[0]
                                                    .weapon3)
                                                .image)
                                            : Container()
                                    ),
                                  ]
                              ),
                              Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Container(
                                        child:
                                        currentBuild[0].spell1 != 0
                                            ? Equipment(
                                            name: Helpers.findSpellByIdInt(
                                                spells_provider,
                                                currentBuild[0]
                                                    .spell1
                                                    )
                                                .name,
                                            image: Helpers.findSpellByIdInt(
                                                spells_provider,
                                                currentBuild[0]
                                                    .spell1
                                                    )
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].spell2 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findSpellByIdInt(
                                                spells_provider,
                                                currentBuild[0]
                                                    .spell2
                                                    )
                                                .name,
                                            image: Helpers.findSpellByIdInt(
                                                spells_provider,
                                                currentBuild[0]
                                                    .spell2
                                                    )
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].spell3 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findSpellByIdInt(
                                                spells_provider,
                                                currentBuild[0]
                                                    .spell3
                                                    )
                                                .name,
                                            image: Helpers.findSpellByIdInt(
                                                spells_provider,
                                                currentBuild[0]
                                                    .spell3
                                                    )
                                                .image)
                                            : Container()
                                    ),
                                  ]
                              ),
                              Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Container(
                                        child:
                                        currentBuild[0].talisman1 != 0
                                            ? Equipment(
                                            name: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman1.toString()
                                                    )
                                                .name,
                                            image: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman1.toString()
                                                    )
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].talisman2 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman2.toString()
                                                    )
                                                .name,
                                            image: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman2.toString()
                                                    )
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].talisman3 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman3.toString()
                                                    )
                                                .name,
                                            image: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman3.toString()
                                                    )
                                                .image)
                                            : Container()
                                    ),
                                  ]
                              ),
                            ]
                            )
                        ),
                        const TabBar(
                          tabs: [
                            Tab(
                              child: Text("Weapon"),
                            ),
                            Tab(
                              child: Text("Spells"),
                            ),
                            Tab(
                              child: Text("Talismans"),
                            ),
                          ],
                        ),
                      ]
                  )
              ),
            ],
          ),
        )
    );
  }
}

//Functions to get the equipment data from database with the id contained in the build
class Helpers {
  static findById(list, String id) {

    var findById = (obj) => obj.id == id;
    var result = list.where(findById);
    return result.length > 0 ? result.first : null;
  }
  static findByIdInt(list, int id) {

  var result = list.where((objet) => objet.weapon_id == id);
    return result.length > 0 ? result.first : null;
  }
  static findSpellByIdInt(list, int id) {

  var result = list.where((objet) => objet.spell_id == id);
    return result.length > 0 ? result.first : null;
  }
  static findTalismanByIdInt(list, int id) {

  var result = list.where((objet) => objet.talisman_id == id);
    return result.length > 0 ? result.first : null;
  }
}
