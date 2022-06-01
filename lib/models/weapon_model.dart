class Weapon {
  int weapon_id;
  String name;
  String image;

  Weapon(
      { required this.weapon_id,
      required this.name,
      required this.image});

  Weapon.fromJson(Map<String, dynamic> json)
      : weapon_id = json['weapon_id'],
        name = json['name'],
        image = json['image'];

  Map<String, dynamic> toJson() {
    return {
      'weapon_id': weapon_id,
      'name': name,
      'image': image,
    };
  }

  String showWeapon() {
    return "$name\n$weapon_id\n$image\n";
  }
  String getName() {
    return "$name";
  }
}
