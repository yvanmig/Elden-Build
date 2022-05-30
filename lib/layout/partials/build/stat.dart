import 'package:flutter/material.dart';

class Stat extends StatelessWidget {
  final int value;
  final String name;

  const Stat(
      {
        required this.value,
        required this.name,
      }
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyle(color: Colors.white)),
        Text(value.toString(), style:TextStyle(color: Colors.white))
      ],
    );
  }
}


