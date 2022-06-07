class Spell {
  int spell_id;
  String name;
  String image;

  Spell(
      { required this.spell_id,
      required this.name,
      required this.image});

  Spell.fromJson(Map<String, dynamic> json)
      : spell_id = json['spell_id'],
        name = json['name'],
        image = json['image'];

  Map<String, dynamic> toJson() {
    return {
      'spell_id': spell_id,
      'name': name,
      'image': image,
    };
  }

  String showSpell() {
    return "$name\n$spell_id\n$image\n";
  }
}
