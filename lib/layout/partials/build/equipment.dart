import 'package:flutter/material.dart';

class Equipment extends StatelessWidget {
  final String image;
  final String name;

  const Equipment(
      {
        required this.image,
        required this.name,
      }
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          width: 75,
          height: 75,
          image: NetworkImage(image),
        ),
        Expanded(
            child: Text(name, style: TextStyle(color: Colors.white)))
      ],
    );
  }
}


