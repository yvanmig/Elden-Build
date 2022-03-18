import 'package:elden_build/layout/layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elden Build',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        BuildPage.routeName : (context)=> BuildPage(),
        ListBuild.routeName : (context) => ListBuild(),
        Login.routeName : (context) => Login(),
        Onboarding.routeName : (context) => Onboarding(),
        Profile.routeName : (context) => Profile(),
        Register.routeName : (context) => Register(),
        SplashScreen.routeName : (context) => SplashScreen(),
        BuildPage.routeName : (context) => BuildPage(),
      },
      initialRoute: Login.routeName,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFound());
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


