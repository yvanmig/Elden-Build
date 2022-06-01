class User {
  String? id;
  String pseudo;
  String email;
  String photo;
  String bio;
  String pass;

  User({
    this.id,
    required this.pseudo,
    required this.email,
    required this.photo,
    required this.bio,
    required this.pass,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        pseudo = json['pseudo'],
        email = json['email'],
        photo = json['photo'],
        bio = json['bio'],
        pass = json['pass'];

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
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
