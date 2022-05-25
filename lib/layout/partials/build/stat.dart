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
        Text(name),
        Text(value.toString())
      ],
    );
  }
}


