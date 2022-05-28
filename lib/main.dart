import 'dart:js';

import 'package:elden_build/layout/layout.dart';
import 'package:elden_build/layout/pages/create_build.dart';
import 'package:elden_build/models/build_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elden_build/models/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  late UserProvider userProvider = UserProvider();
  late BuildProvider buildProvider = BuildProvider();

  @override
  void initState() {
    super.initState();
    userProvider.fetchData();
    buildProvider.fetchData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) {
            return userProvider;
          }),
          ChangeNotifierProvider(create: (BuildContext context) {
            return buildProvider;
          })
        ],
        child: MaterialApp(
          title: 'Elden Build',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Mantinia',
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.white),
            ),
            tabBarTheme: const TabBarTheme(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontFamily: 'Mantinia'), // color for text
                indicator: UnderlineTabIndicator(
                    // color for indicator (underline)
                    borderSide:
                        BorderSide(color: Color.fromRGBO(160, 141, 106, 1.0)))),
          ),
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case BuildPage.routeName:
                {
                  final BuildData arguments = settings.arguments as BuildData;

                  return MaterialPageRoute(builder: (context) {
                    return BuildPage(name: arguments.name, id: arguments.id);
                  });
                }
              case ListBuild.routeName:
                {
                  return MaterialPageRoute(builder: (context) {
                    return ListBuild();
                  });
                }
              case CreateBuild.routeName:
                {
                  return MaterialPageRoute(builder: (context) {
                    return CreateBuild();
                  });
                }
              case Login.routeName:
                {
                  return MaterialPageRoute(builder: (context) {
                    return Login();
                  });
                }
              case Onboarding.routeName:
                {
                  return MaterialPageRoute(builder: (context) {
                    return Onboarding();
                  });
                }
              case Profile.routeName:
                {
                  return MaterialPageRoute(builder: (context) {
                    return Profile();
                  });
                }
              case Register.routeName:
                {
                  return MaterialPageRoute(builder: (context) {
                    return Register();
                  });
                }
            }
          },
          initialRoute: Login.routeName,
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (context) => const NotFound());
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}

class BuildData {
  final String name;
  final int id;

  BuildData({required this.name, required this.id});
}
