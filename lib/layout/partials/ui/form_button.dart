
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String buttonText;
  final String route;

  const FormButton(
      {
        required this.buttonText,
        required this.route,
      }
      );

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
          side: const BorderSide(
              width: 2,
              color: Colors.black
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(buttonText,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20
            )),
      );
  }
}


