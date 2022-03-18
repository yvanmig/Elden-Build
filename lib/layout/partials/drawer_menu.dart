
import 'package:elden_build/layout/partials/drawer_menu_item.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {

  const DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 187, 163, 117),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: const [
              DrawerMenuItem(itemTitle: 'Login', route: '/login'),
              DrawerMenuItem(itemTitle: 'Register', route: '/register'),
              DrawerMenuItem(itemTitle: 'Profile', route: '/profile'),
              DrawerMenuItem(itemTitle: 'ITEM IV', route: 'login'),
              DrawerMenuItem(itemTitle: 'ITEM V', route: 'login'),
            ],
          ),
        )
    );
  }
}