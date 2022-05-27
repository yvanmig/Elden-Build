import 'package:elden_build/layout/partials/drawer_menu.dart';
import 'package:elden_build/model/Equipment_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';
import 'package:provider/provider.dart';

class CreateBuild extends StatefulWidget {
  const CreateBuild({Key? key}) : super(key: key);
  static const String routeName = '/create-build';

  @override
  State<CreateBuild> createState() => _CreateBuildForm();
}
class _CreateBuildForm extends State<CreateBuild> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> stats = [
    "STR",
    "INT",
    "MND",
    "DEX",
    "VIG",
    "ARC",
    "FTH",
  ];

  var statDropDownValue1 = "STR";
  var statDropDownValue2 = "INT";

  var weaponDropDownValue1;
  var weaponDropDownValue2;
  var weaponDropDownValue3;
  List<Equipment2> weapons = [
   Equipment2(id: 1, name: "Rusty sword"),
   Equipment2(id: 12, name: "Envoy horn"),
   Equipment2(id: 13, name: "Fortissax spear"),
   Equipment2(id: 14, name: "Great Sword"),
  ];

  var spellDropDownValue1;
  var spellDropDownValue2;
  var spellDropDownValue3;
  List<Equipment2> spells = [
   Equipment2(id: 1, name: "Elden Stars"),
   Equipment2(id: 12, name: "Big hurty laser"),
   Equipment2(id: 13, name: "Lightning Spear"),
   Equipment2(id: 14, name: "Golden Vow"),
  ];

  var talismanDropDownValue1;
  var talismanDropDownValue2;
  var talismanDropDownValue3;
  List<Equipment2> talismans = [
   Equipment2(id: 1, name: "Faith canvas"),
   Equipment2(id: 12, name: "Rot idol"),
   Equipment2(id: 13, name: "Dragoncrest shield"),
   Equipment2(id: 14, name: "Blood Lord insignia"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      drawer: const DrawerMenu(),
      body: ListView(
        children: [
          Column(
            children:  const [
              Text('Elden rinG',
                  style: TextStyle(color: Colors.black, fontSize: 40)),
              Text('Create A Build',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                child: TextFormField(
                  style: const TextStyle(color: Colors.blueGrey),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Build Name',
                    hintText: 'Envoy Pyromancer',
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                child: TextFormField(
                  style: const TextStyle(color: Colors.blueGrey),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'Describe your build in a few words',
                  ),
                ),
              ),
              Text("Choose the 2 main stats for this build", style: TextStyle(fontSize: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    value: statDropDownValue1,
                    icon: const Icon(Icons.arrow_downward),
                    dropdownColor: Colors.black,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        statDropDownValue1 = newValue!;
                      });
                    },
                    items: stats.map((String stat) {
                      return DropdownMenuItem<String>(
                        value: stat,
                        child: Text(stat),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: statDropDownValue2,
                    icon: const Icon(Icons.arrow_downward),
                    dropdownColor: Colors.black,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        statDropDownValue2 = newValue!;
                      });
                    },
                    items: stats.map((String stat) {
                      return DropdownMenuItem<String>(
                        value: stat,
                        child: Text(stat),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                    // border: Border.(width: 0.5, color: Color.fromRGBO(160, 141, 106, 1.0))
                  border: Border(
                    top: BorderSide(width: 0.8, color: Color.fromRGBO(160, 141, 106, 1.0)),
                    bottom: BorderSide(width: 0.8, color: Color.fromRGBO(160, 141, 106, 1.0)),
                  )
                ),
                child: Column(
                  children: [
                    const Text("Weapons", style: TextStyle(fontSize: 20)),
                    DropdownButton<String>(
                      hint: const Text("Select a weapon", style: TextStyle(color: Colors.white)),
                      value: weaponDropDownValue1,
                      icon: const Icon(Icons.arrow_downward),
                      dropdownColor: Colors.black,
                      elevation: 16,
                      style: const TextStyle(color: Colors.white),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          weaponDropDownValue1 = newValue!;
                        });
                      },
                      items: weapons.map((Equipment2 weapon) {
                        return DropdownMenuItem<String>(
                          value: weapon.id.toString(),
                          child: Text(weapon.name),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      hint: const Text("(Optional) Select a weapon", style: TextStyle(color: Colors.white)),
                      value: weaponDropDownValue2,
                      icon: const Icon(Icons.arrow_downward),
                      dropdownColor: Colors.black,
                      elevation: 16,
                      style: const TextStyle(color: Colors.white),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          weaponDropDownValue2 = newValue!;
                        });
                      },
                      items: weapons.map((Equipment2 weapon) {
                        return DropdownMenuItem<String>(
                          value: weapon.id.toString(),
                          child: Text(weapon.name),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      hint: const Text("(Optional) Select a weapon", style: TextStyle(color: Colors.white)),
                      value: weaponDropDownValue3,
                      icon: const Icon(Icons.arrow_downward),
                      dropdownColor: Colors.black,
                      elevation: 16,
                      style: const TextStyle(color: Colors.white),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          weaponDropDownValue3 = newValue!;
                        });
                      },
                      items: weapons.map((Equipment2 weapon) {
                        return DropdownMenuItem<String>(
                          value: weapon.id.toString(),
                          child: Text(weapon.name),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.8, color: Color.fromRGBO(160, 141, 106, 1.0)),
                  bottom: BorderSide(width: 0.8, color: Color.fromRGBO(160, 141, 106, 1.0)),
                )
              ),
              child:
             Column(
               children: [
                 const Text("Spells", style: TextStyle(fontSize: 20)),
                 DropdownButton<String>(
                   hint: const Text("Select a spell", style: TextStyle(color: Colors.white)),
                   value: spellDropDownValue1,
                   icon: const Icon(Icons.arrow_downward),
                   dropdownColor: Colors.black,
                   elevation: 16,
                   style: const TextStyle(color: Colors.white),
                   underline: Container(
                     height: 2,
                     color: Colors.white,
                   ),
                   onChanged: (String? newValue) {
                     setState(() {
                       spellDropDownValue1 = newValue!;
                     });
                   },
                   items: spells.map((Equipment2 spell) {
                     return DropdownMenuItem<String>(
                       value: spell.id.toString(),
                       child: Text(spell.name),
                     );
                   }).toList(),
                 ),
                 DropdownButton<String>(
                   hint: const Text("(Optional) Select a spell", style: TextStyle(color: Colors.white)),
                   value: spellDropDownValue2,
                   icon: const Icon(Icons.arrow_downward),
                   dropdownColor: Colors.black,
                   elevation: 16,
                   style: const TextStyle(color: Colors.white),
                   underline: Container(
                     height: 2,
                     color: Colors.white,
                   ),
                   onChanged: (String? newValue) {
                     setState(() {
                       spellDropDownValue2 = newValue!;
                     });
                   },
                   items: spells.map((Equipment2 spell) {
                     return DropdownMenuItem<String>(
                       value: spell.id.toString(),
                       child: Text(spell.name),
                     );
                   }).toList(),
                 ),
                 DropdownButton<String>(
                   hint: const Text("(Optional) Select a spell", style: TextStyle(color: Colors.white)),
                   value: spellDropDownValue3,
                   icon: const Icon(Icons.arrow_downward),
                   dropdownColor: Colors.black,
                   elevation: 16,
                   style: const TextStyle(color: Colors.white),
                   underline: Container(
                     height: 2,
                     color: Colors.white,
                   ),
                   onChanged: (String? newValue) {
                     setState(() {
                       spellDropDownValue3 = newValue!;
                     });
                   },
                   items: spells.map((Equipment2 spell) {
                     return DropdownMenuItem<String>(
                       value: spell.id.toString(),
                       child: Text(spell.name),
                     );
                   }).toList(),
                 ),
               ],
             ),
            ),
             Container(
             padding: const EdgeInsets.all(15.0),
             decoration: const BoxDecoration(
               border: Border(
                 top: BorderSide(width: 0.8, color: Color.fromRGBO(160, 141, 106, 1.0)),
                 bottom: BorderSide(width: 0.8, color: Color.fromRGBO(160, 141, 106, 1.0)),
                )
              ),
             child:
               Column(
                 children: [
                   const Text("Talismans", style: TextStyle(fontSize: 20)),
                   DropdownButton<String>(
                     hint: const Text("Select a talisman", style: TextStyle(color: Colors.white)),
                     value: talismanDropDownValue1,
                     icon: const Icon(Icons.arrow_downward),
                     dropdownColor: Colors.black,
                     elevation: 16,
                     style: const TextStyle(color: Colors.white),
                     underline: Container(
                       height: 2,
                       color: Colors.white,
                     ),
                     onChanged: (String? newValue) {
                       setState(() {
                         talismanDropDownValue1 = newValue!;
                       });
                     },
                     items: talismans.map((Equipment2 talisman) {
                       return DropdownMenuItem<String>(
                         value: talisman.id.toString(),
                         child: Text(talisman.name),
                       );
                     }).toList(),
                   ),
                   DropdownButton<String>(
                     hint: const Text("(Optional) Select a talisman", style: TextStyle(color: Colors.white)),
                     value: talismanDropDownValue2,
                     icon: const Icon(Icons.arrow_downward),
                     dropdownColor: Colors.black,
                     elevation: 16,
                     style: const TextStyle(color: Colors.white),
                     underline: Container(
                       height: 2,
                       color: Colors.white,
                     ),
                     onChanged: (String? newValue) {
                       setState(() {
                         talismanDropDownValue2 = newValue!;
                       });
                     },
                     items: talismans.map((Equipment2 talisman) {
                       return DropdownMenuItem<String>(
                         value: talisman.id.toString(),
                         child: Text(talisman.name),
                       );
                     }).toList(),
                   ),
                   DropdownButton<String>(
                     hint: const Text("(Optional) Select a talisman", style: const TextStyle(color: Colors.white)),
                     value: talismanDropDownValue3,
                     icon: const Icon(Icons.arrow_downward),
                     dropdownColor: Colors.black,
                     elevation: 16,
                     style: const TextStyle(color: Colors.white),
                     underline: Container(
                       height: 2,
                       color: Colors.white,
                     ),
                     onChanged: (String? newValue) {
                       setState(() {
                         talismanDropDownValue3 = newValue!;
                       });
                     },
                     items: talismans.map((Equipment2 talisman) {
                       return DropdownMenuItem<String>(
                         value: talisman.id.toString(),
                         child: Text(talisman.name),
                       );
                     }).toList(),
                   ),
                 ],
                ),
             ),
            ],
          ),
          Column(
            children: [
              //TODO change route
              const FormButton(buttonText: "Create Build", route: "/login"),
            ],
          ),
        ],
      ),
    );
  }

  //TODO fix the setState function not updating the corresponding state value then use widget for each dropdown
  Widget _equipementDropDown(String hintText, var dropDownValue, List<Equipment2> equipments) {
    return  DropdownButton<String>(
      hint: Text(hintText, style: TextStyle(color: Colors.white)),
      value: dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      dropdownColor: Colors.black,
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropDownValue = newValue!;
        });
      },
      items: equipments.map((Equipment2 equipment) {
        return DropdownMenuItem<String>(
          value: equipment.id.toString(),
          child: Text(equipment.name),
        );
      }).toList(),
    );
  }

}