import 'package:elden_build/layout/partials/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:elden_build/layout/layout.dart';
import 'package:elden_build/models/user_provider.dart';
import 'package:elden_build/models/user_model.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<UserProvider>(context).users;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: const CustomAppBar(),
        drawer: const DrawerMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
                children: users.map((user) {
              return Container(
                  child: Column(children: [
                Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("img/${user.photo}")))),
                Column(children: [
                  ProfileRow(rowTitle: "Pseudo", rowData: user.pseudo),
                  ProfileRowDivider(),
                  ProfileRow(rowTitle: "Email", rowData: user.email),
                  ProfileRowDivider(),
                ])
              ]));
            }).toList())
          ],
        ));
  }
}
