import 'package:elden_build/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final String buildImage;
  final String buildStats;
  final String buildTitle;
  final String buildDescription;
  final int buildId;

  const BuildCard({
    required this.buildImage,
    required this.buildStats,
    required this.buildTitle,
    required this.buildDescription,
    required this.buildId,
  });

  @override
  Widget build(BuildContext context) {
    String thumbnailImage = _getBuildThumbnailFromStat(buildStats);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/build-page",
            arguments: BuildData(name: buildTitle, id: buildId));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        // Change button text when light changes state.
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.all(20.0),
          color: const Color.fromRGBO(160, 141, 106, 1.0),
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        buildTitle,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Container (
                        width: 120,
                        height: 90,
                        child: Image(image: NetworkImage(thumbnailImage)),
                      ),
                      Text(
                        buildStats,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Flexible(
                    child: Container(
                      width: 180,
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Text(
                        buildDescription,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: 'Garamond',
                          letterSpacing: 0.3
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

String _getBuildThumbnailFromStat(String stat) {
  if(stat.contains("STR")) {

    return "img/strength.jpg";
  } else if(stat.contains("INT")) {

    return "img/intelligence.png";
  } else if(stat.contains("DEX")) {

    return "img/dexterity.jpg";
  } else {

    return "img/faith.jpg";
  }
}
