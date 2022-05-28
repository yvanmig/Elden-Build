import 'package:elden_build/main.dart';
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
          color: Color.fromRGBO(160, 141, 106, 1.0),
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image(image: NetworkImage(buildImage)),
                      Text(
                        buildStats,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        buildTitle,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        buildDescription,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
