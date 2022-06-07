class Talisman {
  int talisman_id;
  String name;
  String image;

  Talisman(
      { required this.talisman_id,
      required this.name,
      required this.image});

  Talisman.fromJson(Map<String, dynamic> json)
      : talisman_id = json['talisman_id'],
        name = json['name'],
        image = json['image'];

  Map<String, dynamic> toJson() {
    return {
      'talisman_id': talisman_id,
      'name': name,
      'image': image,
    };
  }

  String showTalisman() {
    return "$name\n$talisman_id\n$image\n";
  }
  String getName() {
    return "$name";
  }
}
