import 'package:elden_build/layout/pages/build_page.dart';
import 'package:elden_build/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:objectid/objectid.dart';
import 'dart:collection';
import 'dart:convert';
import 'build_model.dart';

class BuildProvider with ChangeNotifier {
  final String host = 'http://localhost:80';
  late List<Build> _builds = [];
  late List<Build> build = [];

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

  Future<void> addBuild(Build newBuild) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/addbuild'),
        body: json.encode(newBuild.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      if (response.statusCode == 200) {
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  void getBuild(String id) async {
    try {
      http.Response response =
          await http.get(Uri.parse('$host/api/getbuild/' + id));
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        Build currentBuild = Build.fromJson(map['builds']);
        notifyListeners();
        build = [];
        build.add(currentBuild);
      }
    } catch (e) {
      rethrow;
    }
  }
}
