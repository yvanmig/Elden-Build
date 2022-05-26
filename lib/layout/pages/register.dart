import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:elden_build/layout/layout.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:elden_build/models/user_provider.dart';
import 'package:elden_build/models/user_model.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = '/register';

  @override
  State<Register> createState() => _RegisterForm();
}

class _RegisterForm extends State<Register> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  late User newUser;

  String? pseudo;
  String? email;
  String? bio;
  String? pass;
  String? photo;

  @override
  void initState() {
    newUser = User(pseudo: " ", email: " ", photo: " ", bio: " ", pass: " ");
    super.initState();
  }

  Future<void> submitRegister() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        await Provider.of<UserProvider>(context, listen: false)
            .addUser(newUser);

        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
              SnackBar(content: Text("${newUser.pseudo} a été ajouté !")));
      }
    } catch (e) {
      print("Erreur, votre profil n'est pas créé !");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
              Text('RegisteR',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ],
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blueGrey),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'coucou@coucou.com',
                    ),
                    onSaved: (value) => newUser.email = value!,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Saississer un email valide !'
                            : null,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blueGrey),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: 'Pseudo',
                    ),
                    onSaved: (value) => newUser.pseudo = value!,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blueGrey),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onSaved: (value) => newUser.pass = value!,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blueGrey),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: 'Confirm password',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blueGrey),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: 'Bio',
                    ),
                    onSaved: (value) => newUser.bio = value!,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              // const FormButton(buttonText: "REGISTER", route: "/REGISTER"),
              ElevatedButton(
                  onPressed: submitRegister, child: const Text("REGISTER")),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "You already have an account ?",
                      style: TextStyle(color: Colors.white),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
