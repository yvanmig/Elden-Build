
import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final String itemTitle;
  final String route;

  const DrawerMenuItem(
      {
        required this.itemTitle,
        required this.route,
      }
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          itemTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Mantinia',
              color: Colors.white,
              fontSize: 30
          )
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}


