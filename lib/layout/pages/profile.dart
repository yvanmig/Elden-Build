import 'package:elden_build/layout/partials/drawer_menu.dart';
import 'package:elden_build/main.dart';
import 'package:flutter/material.dart';
import 'package:elden_build/layout/layout.dart';
import 'package:elden_build/models/user_provider.dart';
import 'package:elden_build/models/user_model.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  String _path = "";

  void _showPhotoLibrary() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);

    //TODO save _path to db when it's updated and use it to fetch image path rather than using the local variable
    setState(() {
      _path = file.path;
    });
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              color: Color.fromRGBO(160, 141, 106, 1.0),
              height: 75,
              child: Column(children: <Widget>[
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showPhotoLibrary();
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Choose from your library",
                        style: TextStyle(color: Colors.white))
                )
              ]
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = Provider
        .of<UserProvider>(context)
        .users;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: const CustomAppBar(),
        drawer: const DrawerMenu(),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _path == ""
                ? Image.asset("img/logo.png", width: 190, height: 190)
                :
            Image.file(
              File(_path),
              width: 190,
              height: 190,
            )
            ,
            //TODO Use this block to display img with the path stored in db instead of the local variable
            /*         _path == "" ? Image.asset("img/logo.png", width: 190, height: 190) :
                  Container(
              width: 190.0,
              height: 190.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("img/${user.photo}"),
                  )
                )
              ),*/

            TextButton(
              child: Text("Change picture",
                  style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(160, 141, 106, 1.0),
              ),
              onPressed: () {
                _showOptions(context);
              },
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40),
                child:
                Column(children: [
                  ProfileRow(
                      rowTitle: "Pseudo", rowData: MyApp.currentUser!.pseudo),
                  ProfileRowDivider(),
                  ProfileRow(
                      rowTitle: "Email", rowData: MyApp.currentUser!.email),
                  ProfileRowDivider(),
                  ProfileRow(
                      rowTitle: "Bio", rowData: MyApp.currentUser!.bio),
                  ProfileRowDivider(),
                ])
            ),
          ],
        )
/*              Column(
                  children: users.map((user) {
                    return Container(
                        child: Column(children: <Widget>[
                          */ /*       Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("img/${user.photo}")
                            )
                            )
                            ),*/ /*
                          _path == "" ? Image.asset("img/logo.png") :
                          Image.file(File(_path))
                          ,
                          FlatButton(
                            child: Text("Take Picture", style: TextStyle(color: Colors.white)),
                            color: Colors.green,
                            onPressed: () {
                              _showOptions(context);
                            },
                          ),
                          Column(children: [
                            ProfileRow(rowTitle: "Pseudo", rowData: user.pseudo),
                            ProfileRowDivider(),
                            ProfileRow(rowTitle: "Email", rowData: user.email),
                            ProfileRowDivider(),
                          ])
                        ]));
                  }).toList())*/
    );
  }
}