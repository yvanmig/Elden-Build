class User {
  String pseudo;
  String email;
  String photo;
  String bio;
  String pass;

  User({
    required this.pseudo,
    required this.email,
    required this.photo,
    required this.bio,
    required this.pass,
  });

  User.fromJson(Map<String, dynamic> json)
      : pseudo = json['pseudo'],
        email = json['email'],
        photo = json['photo'],
        bio = json['bio'],
        pass = json['pass'];

  Map<String, dynamic> toJson() {
    return {
      'pseudo': pseudo,
      'email': email,
      'photo': photo,
      'bio': bio,
      'pass': pass,
    };
  }

  String showUser() {
    return "$pseudo\n$email\n$bio\n";
  }
}
