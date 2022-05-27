import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';
import 'build_model.dart';

class BuildProvider with ChangeNotifier {
  final String host = 'http://localhost:80';
  late List<Build> _builds = [];

  UnmodifiableListView<Build> get builds => UnmodifiableListView(_builds);
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/builds'));
      if (response.statusCode == 200) {
        _builds = (json.decode(response.body) as List)
            .map((buildJson) => Build.fromJson(buildJson))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
