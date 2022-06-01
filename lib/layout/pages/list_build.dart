import 'package:elden_build/models/build_model.dart';
import 'package:elden_build/models/build_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';
import 'package:objectid/objectid.dart';
import 'package:provider/provider.dart';

import '../partials/drawer_menu.dart';

class ListBuild extends StatelessWidget {
  const ListBuild({Key? key}) : super(key: key);

  static const String routeName = '/list-build';

  @override
  Widget build(BuildContext context) {
    List<Build> builds = Provider.of<BuildProvider>(context).builds;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      drawer: const DrawerMenu(),
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ListView.builder(
              itemCount: builds.length,
              itemBuilder: (constext, index) {
                final currentBuild = builds[index];
                return BuildCard(
                    buildImage: currentBuild.image,
                    buildStats:
                        currentBuild.mainStat1 + ' / ' + currentBuild.mainStat2,
                    buildTitle: currentBuild.name,
                    buildDescription: currentBuild.description,
                    buildId: currentBuild.id);
              })),
    );
  }
}
