
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfileRowDivider extends StatelessWidget {

  const ProfileRowDivider();

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 120,
        height: 10,
        child:
        const Divider(
          color: Colors.orange,
        )
    );
  }
}


