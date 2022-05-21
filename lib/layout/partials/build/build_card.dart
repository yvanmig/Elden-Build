
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final String buildImage;
  final String buildStats;
  final String buildTitle;
  final String buildDescription;

  const BuildCard(
      {
        required this.buildImage,
        required this.buildStats,
        required this.buildTitle,
        required this.buildDescription,
      }
  );

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: const EdgeInsets.all(20.0),
        color: Color.fromRGBO(160, 141, 106, 1.0),
        child:
        Padding(
            padding: const EdgeInsets.all(5),
            child:
            Row(
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
            )
        ),
      );
  }
}


