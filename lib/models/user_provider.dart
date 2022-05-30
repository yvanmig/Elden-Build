import 'package:elden_build/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';
import 'user_model.dart';

class UserProvider with ChangeNotifier {
  final String host = 'http://localhost:80';
  late List<User> _users = [];

  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/users'));
      if (response.statusCode == 200) {
        _users = (json.decode(response.body) as List)
            .map((userJson) => User.fromJson(userJson))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addUser(User newUser) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/register'),
        body: json.encode(newUser.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      if (response.statusCode == 200) {
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> logUser(User user) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/login'),
        body: json.encode(user.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      Map<String, dynamic> temp = json.decode(response.body);

      if (response.statusCode == 200) {
        return ("200");
      } else {
        return (temp['error']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
