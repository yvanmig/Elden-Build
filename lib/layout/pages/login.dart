import 'package:elden_build/models/user_model.dart';
import 'package:elden_build/models/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late User user;
  bool _passwordVisible = false;
  String errorMessage = " ";

  @override
  void initState() {
    user = User(email: " ", pass: " ", photo: " ", pseudo: " ", bio: " ");
    super.initState();
  }

  Future<void> logUser() async {
    String rep =
        await Provider.of<UserProvider>(context, listen: false).logUser(user);

    if (rep == "200") {
      Navigator.pushNamed(context, Profile.routeName);
    } else {
      setState(() {
        errorMessage = rep;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: const [
              Image(
                height: 230,
                image: NetworkImage('img/logo.png'),
              ),
              Text('Elden rinG',
                  style: TextStyle(color: Colors.white, fontSize: 40)),
              Text('LogiN',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ],
          ),
          Form(
              key: loginFormKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontFamily: "Mantinia"),
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                      onSaved: (value) => user.email = value!,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontFamily: "Mantinia"),
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                      onSaved: (value) => user.pass = value!,
                    ),
                  ),
                ],
              )),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  loginFormKey.currentState?.save();
                  logUser();
                },
                child: const Text("SE CONNECTER"),
              ),
          Padding(
            padding :const EdgeInsets.only(top:20),
            child:
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "You don't have an account yet ?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: ' sign in',
                      style: const TextStyle(color: Colors.blueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, "/register");
                        },
                    ),
                  ],
                ),
              ),
            )
            ],
          ),
        ],
      ),
    );
  }
}
