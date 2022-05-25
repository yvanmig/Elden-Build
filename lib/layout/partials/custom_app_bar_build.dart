import 'package:flutter/material.dart';

class CustomAppBarBuild extends StatefulWidget implements PreferredSizeWidget {
  final String buildName;
  const CustomAppBarBuild({required this.buildName, Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarBuildState createState() => _CustomAppBarBuildState();
}

class _CustomAppBarBuildState extends State<CustomAppBarBuild>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(160, 141, 106, 1.0),
      title: Center(
          child: Text(widget.buildName)
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person_sharp),
          tooltip: 'User Profile',
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
    );
  }
}