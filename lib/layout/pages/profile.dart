import 'package:elden_build/layout/partials/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:elden_build/layout/layout.dart';
import 'package:elden_build/models/user_provider.dart';
import 'package:elden_build/models/user_model.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: const CustomAppBar(),
        drawer: const DrawerMenu(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                      child: Column(children: [
                    Container(
                      width: 190.0,
                      height: 190.0,
                      //
                    ),
                    Column(children: [
                      ProfileRow(rowTitle: "Pseudo", rowData: user.pseudo),
                      ProfileRowDivider(),
                      ProfileRow(rowTitle: "Email", rowData: user.email),
                      ProfileRowDivider(),
                      ProfileRow(rowTitle: "bio", rowData: user.bio),
                      ProfileRowDivider(),
                    ])
                  ]))
                ],
              )
            ]));
  }
}

class LoginData {
  final String email;

  LoginData({required this.email});
}
