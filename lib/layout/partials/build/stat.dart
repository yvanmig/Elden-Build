import 'package:flutter/material.dart';

class Stat extends StatelessWidget {
  final String? value;
  final String name;

  const Stat({
    this.value = " ",
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyle(color: Colors.white)),
        Text(value ?? " ", style: TextStyle(color: Colors.white))
      ],
    );
  }
}
