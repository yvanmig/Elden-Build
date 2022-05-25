import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';

class Onboarding extends StatelessWidget {
  static const String routeName = '/onboarding';
  const Onboarding();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Image(
                  height: 265,
                  image: NetworkImage('img/logo.png'),
                ),
                Text('Elden rinG',
                    style: TextStyle(
                      color: Colors.white,
                    ))
              ],
            ),
            ImageSlideshow(
                height: 200,
                initialPage: 0,
                autoPlayInterval: 0,
                isLoop: false,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 40.0, left: 40.0),
                      child: Text(
                        'Welcome to Elden Ring Builder ! Find the strongest build and become the Elden Lord',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Center(
                        child: Text(
                            'You can also add your creations and share them',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Center(
                        child: Image(
                          height: 25,
                          image: NetworkImage('img/frame.png'),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                          'Finally, you can vote and register your favorite builds',
                          style: TextStyle(color: Colors.white)),
                      GetStartedButton(
                          buttonText: 'Get Started', route: '/login')
                    ],
                  )
                ])
          ],
        ));
  }
}
