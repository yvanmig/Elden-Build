import 'package:elden_build/layout/pages/build_page.dart';
import 'package:elden_build/main.dart';
import 'package:elden_build/models/weapon_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:objectid/objectid.dart';
import 'dart:collection';
import 'dart:convert';

class WeaponProvider with ChangeNotifier {
  final String host = 'http://localhost:80';
  late List<Weapon> _weapons = [];
  late List<Weapon> weapon = [];

  UnmodifiableListView<Weapon> get weapons => UnmodifiableListView(_weapons);
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/weapons'));
      if (response.statusCode == 200) {

        _weapons = (json.decode(response.body) as List)
            .map((weaponJson) => Weapon.fromJson(weaponJson))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  void getWeapon(String id) async {
    try {
      http.Response response =
          await http.get(Uri.parse('$host/api/getWeapon/' + id));
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        Weapon currentWeapon = Weapon.fromJson(map['weapons']);
        notifyListeners();
        weapon = [];
        weapon.add(currentWeapon);
      }
    } catch (e) {
      rethrow;
    }
  }
}
