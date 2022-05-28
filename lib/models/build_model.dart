import 'dart:math';

import 'package:flutter/material.dart';

class Build {
  String name;
  String image;
  String description;
  String mainStat1;
  String mainStat2;
  int vigor;
  int mind;
  int endurence;
  int strength;
  int dexterity;
  int intelligence;
  int faith;
  int arcane;
  int weapon1;
  int weapon2;
  int weapon3;
  int spell1;
  int spell2;
  int spell3;
  int talisman1;
  int talisman2;
  int talisman3;

  Build(
      {required this.name,
      required this.image,
      required this.description,
      required this.mainStat1,
      required this.mainStat2,
      required this.vigor,
      required this.mind,
      required this.endurence,
      required this.strength,
      required this.dexterity,
      required this.intelligence,
      required this.faith,
      required this.arcane,
      required this.weapon1,
      required this.weapon2,
      required this.weapon3,
      required this.spell1,
      required this.spell2,
      required this.spell3,
      required this.talisman1,
      required this.talisman2,
      required this.talisman3});

  Build.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        description = json['description'],
        mainStat1 = json['mainStat1'],
        mainStat2 = json['mainStat2'],
        vigor = json['vigor'],
        mind = json['mind'],
        endurence = json['endurence'],
        strength = json['strength'],
        dexterity = json['dexterity'],
        intelligence = json['intelligence'],
        faith = json['faith'],
        arcane = json['arcane'],
        weapon1 = json['weapon1'],
        weapon2 = json['weapon2'],
        weapon3 = json['weapon3'],
        spell1 = json['spell1'],
        spell2 = json['spell2'],
        spell3 = json['spell3'],
        talisman1 = json['talisman1'],
        talisman2 = json['talisman2'],
        talisman3 = json['talisman3'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'mainStat1': mainStat1,
      'mainStat2': mainStat2,
      'vigor': vigor,
      'mind': mind,
      'endurence': endurence,
      'strength': strength,
      'dexterity': dexterity,
      'intelligence': intelligence,
      'faith': faith,
      'arcane': arcane,
      'weapon1': weapon1,
      'weapon2': weapon2,
      'weapon3': weapon3,
      'spell1': spell1,
      'spell2': spell2,
      'spell3': spell3,
      'talisman1': talisman1,
      'talisman2': talisman2,
      'talisman3': talisman3
    };
  }

  String showBuild() {
    return "$name\n$description\n$mainStat1\n$mainStat2\n";
  }
}
