import 'package:elden_build/layout/pages/build_page.dart';
import 'package:elden_build/main.dart';
import 'package:elden_build/models/spell_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';

class SpellProvider with ChangeNotifier {
  final String host = 'http://localhost:80';
  late List<Spell> _spells = [];
  late List<Spell> spell = [];

  UnmodifiableListView<Spell> get spells => UnmodifiableListView(_spells);
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/spells'));
      if (response.statusCode == 200) {

        _spells = (json.decode(response.body) as List)
            .map((spellJson) => Spell.fromJson(spellJson))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  void getSpell(String id) async {
    try {
      http.Response response =
          await http.get(Uri.parse('$host/api/getspell/' + id));
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        Spell currentSpell = Spell.fromJson(map['spells']);
        notifyListeners();
        spell = [];
        spell.add(currentSpell);
      }
    } catch (e) {
      rethrow;
    }
  }
}
