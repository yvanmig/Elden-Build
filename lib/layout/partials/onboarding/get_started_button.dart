
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final String buttonText;
  final String route;

  const GetStartedButton(
      {
        required this.buttonText,
        required this.route,
      }
      );

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: const BorderSide(
              width: 2,
              color: Colors.white
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(buttonText,
            style: const TextStyle(color: Colors.white)),
      );
  }
}


