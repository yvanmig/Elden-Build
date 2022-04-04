import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(160, 141, 106, 1.0),
      title: const Center(
          child: Text('Elden Build')
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