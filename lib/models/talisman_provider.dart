import 'package:elden_build/layout/pages/build_page.dart';
import 'package:elden_build/main.dart';
import 'package:elden_build/models/talisman_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:objectid/objectid.dart';
import 'dart:collection';
import 'dart:convert';

import 'talisman_model.dart';

class TalismanProvider with ChangeNotifier {
  final String host = 'http://localhost:80';
  late List<Talisman> _talismans = [];
  late List<Talisman> talisman = [];

  UnmodifiableListView<Talisman> get talismans => UnmodifiableListView(_talismans);
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/talismans'));
      if (response.statusCode == 200) {

        _talismans = (json.decode(response.body) as List)
            .map((talismanJson) => Talisman.fromJson(talismanJson))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  void getTalisman(String id) async {
    try {
      http.Response response =
          await http.get(Uri.parse('$host/api/getTalisman/' + id));
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        Talisman currentTalisman = Talisman.fromJson(map['talismans']);
        notifyListeners();
        talisman = [];
        talisman.add(currentTalisman);
      }
    } catch (e) {
      rethrow;
    }
  }
}
