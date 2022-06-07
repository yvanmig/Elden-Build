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
  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  late User updateUser;

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
                        style: TextStyle(color: Colors.white)))
              ]));
        });
  }

  Future<void> updateProfile() async {
    try {
      updateFormKey.currentState!.save();
      updateUser.id = MyApp.currentUser!.id;

      await Provider.of<UserProvider>(context, listen: false)
          .userUpdate(updateUser, updateUser.id ?? "");

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content:
                Text("Votre profil ${updateUser.pseudo} a été modifié !")));

      Provider.of<UserProvider>(context).fetchData();
    } catch (e) {
      print("Erreur, votre profile n'a pas été modifié !");
    }
  }

  @override
  void initState() {
    updateUser =
        User(id: " ", pseudo: " ", email: " ", photo: " ", bio: " ", pass: " ");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<UserProvider>(context).users;
    print(MyApp.currentUser!.id);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      drawer: const DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _path == ""
              ? Image.asset("img/logo.png", width: 190, height: 190)
              : Image.file(
                  File(_path),
                  width: 190,
                  height: 190,
                ),
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
            child:
                Text("Change picture", style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
              backgroundColor: Color.fromRGBO(160, 141, 106, 1.0),
            ),
            onPressed: () {
              _showOptions(context);
            },
          ),
          Form(
            key: updateFormKey,
            child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(children: [
                  TextFormField(
                    initialValue: MyApp.currentUser!.pseudo,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontFamily: "Mantinia"),
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: 'Pseudo',
                    ),
                    onSaved: (value) => updateUser.pseudo = value!,
                  ),

                  ProfileRowDivider(),

                  TextFormField(
                    initialValue: MyApp.currentUser!.email,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontFamily: "Mantinia"),
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: 'Build Name',
                    ),
                    onSaved: (value) => updateUser.email = value!,
                  ),

                  ProfileRowDivider(),

                  TextFormField(
                    initialValue: MyApp.currentUser!.bio,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontFamily: "Mantinia"),
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: 'Build Name',
                    ),
                    onSaved: (value) => updateUser.bio = value!,
                  ),

                  TextFormField(
                    initialValue: MyApp.currentUser!.bio,
                  ),

                  // ProfileRow(
                  //     rowTitle: "Pseudo", rowData: MyApp.currentUser!.pseudo),
                  // ProfileRowDivider(),
                  // ProfileRow(
                  //     rowTitle: "Email", rowData: MyApp.currentUser!.email),
                  // ProfileRowDivider(),
                  // ProfileRow(rowTitle: "Bio", rowData: MyApp.currentUser!.bio),
                  // ProfileRowDivider(),
                ])),
          ),
          Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      primary: Color.fromRGBO(160, 141, 106, 1.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      textStyle:
                          TextStyle(fontFamily: 'Mantinia', fontSize: 30)),
                  onPressed: updateProfile,
                  child: const Text("Update profile")),
            ],
          ),
        ],
      ),

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
