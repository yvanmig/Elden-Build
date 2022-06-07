
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final String rowTitle;
  final String rowData;

  const ProfileRow(
      {
        required this.rowTitle,
        required this.rowData,
      }
  );

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: rowTitle + ": ",
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: rowData,
                    style: const TextStyle(color: Colors.white),

                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}


