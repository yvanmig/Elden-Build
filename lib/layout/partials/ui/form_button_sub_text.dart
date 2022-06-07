
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FormButtonSubText extends StatelessWidget {
  final String subText;
  final String linkText;
  final String route;

  const FormButtonSubText(
      {
        required this.subText,
        required this.linkText,
        required this.route
      }
  );

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: subText,
            style: const TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: ' log in',
            style: const TextStyle(color: Colors.blueAccent),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/login");
              },
          ),
        ],
      ),
    );
  }
}


