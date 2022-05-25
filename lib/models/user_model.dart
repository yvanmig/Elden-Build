import 'package:intl/intl.dart';

class User {
  String pseudo;
  String email;
  String photo;
  String bio;

  User({
    required this.pseudo,
    required this.email,
    required this.photo,
    required this.bio,
  });

  User.fromJson(Map<String, dynamic> json)
      : pseudo = json['pseudo'],
        email = json['email'],
        photo = json['photo'],
        bio = json['bio'];

  Map<String, dynamic> toJson() {
    return {
      'pseudo': pseudo,
      'email': email,
      'photo': photo,
      'bio': bio,
    };
  }

  String showUser() {
    return "$pseudo\n$email\n$bio\n";
  }
}
