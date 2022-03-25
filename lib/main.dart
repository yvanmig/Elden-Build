import 'package:elden_build/layout/layout.dart';
import 'package:elden_build/layout/pages/create_build.dart';
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
        fontFamily: 'Mantinia'
      ),
      routes: {
        BuildPage.routeName : (context)=> const BuildPage(),
        CreateBuild.routeName : (context)=> const CreateBuild(),
        ListBuild.routeName : (context) => const ListBuild(),
        Login.routeName : (context) => const Login(),
        Onboarding.routeName : (context) => const Onboarding(),
        Profile.routeName : (context) => const Profile(),
        Register.routeName : (context) => const Register(),
        SplashScreen.routeName : (context) => const SplashScreen(),
        BuildPage.routeName : (context) => const BuildPage(),
      },
      initialRoute: Login.routeName,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFound());
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


