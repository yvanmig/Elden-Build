import 'package:elden_build/models/build_model.dart';
import 'package:elden_build/models/build_provider.dart';
import 'package:flutter/material.dart';
import 'package:elden_build/layout/layout.dart';
import '../../model/EquipmentModel.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(() => {_isLoading = false})
            });
    super.initState();
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
    Provider.of<BuildProvider>(context).getBuild(widget.id as String);
    List<Build> currentBuild = Provider.of<BuildProvider>(context).build;

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

                                    Container(
                                        child:
                                        currentBuild[0].weapon1 != 0
                                            ? Equipment(
                                            name: Helpers.findById(
                                                weapons,
                                                currentBuild[0]
                                                    .weapon1
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                weapons,
                                                currentBuild[0]
                                                    .weapon1
                                                    .toString())
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].weapon2 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findById(
                                                weapons,
                                                currentBuild[0]
                                                    .weapon2
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                weapons,
                                                currentBuild[0]
                                                    .weapon2
                                                    .toString())
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].weapon3 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findById(
                                                weapons,
                                                currentBuild[0]
                                                    .weapon3
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                weapons,
                                                currentBuild[0]
                                                    .weapon3
                                                    .toString())
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
                                            name: Helpers.findById(
                                                spells,
                                                currentBuild[0]
                                                    .spell1
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                spells,
                                                currentBuild[0]
                                                    .spell1
                                                    .toString())
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].spell2 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findById(
                                                spells,
                                                currentBuild[0]
                                                    .spell2
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                spells,
                                                currentBuild[0]
                                                    .spell2
                                                    .toString())
                                                .image)
                                            : Container()
                                    ),
                                    Container(
                                        child:
                                        currentBuild[0].spell3 != 0
                                            ?
                                        Equipment(
                                            name: Helpers.findById(
                                                spells,
                                                currentBuild[0]
                                                    .spell3
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                spells,
                                                currentBuild[0]
                                                    .spell3
                                                    .toString())
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
                                                    .talisman1
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman1
                                                    .toString())
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
                                                    .talisman2
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman2
                                                    .toString())
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
                                                    .talisman3
                                                    .toString())
                                                .name,
                                            image: Helpers.findById(
                                                talismans,
                                                currentBuild[0]
                                                    .talisman3
                                                    .toString())
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

class Helpers {
  static findById(list, String id) {
    var findById = (obj) => obj.id == id;
    var result = list.where(findById);
    return result.length > 0 ? result.first : null;
  }
}
