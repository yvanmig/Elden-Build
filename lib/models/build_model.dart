class Build {
  String name;
  String image;
  String description;
  String stat1;
  String stat2;

  Build(
      {required this.name,
      required this.image,
      required this.description,
      required this.stat1,
      required this.stat2});

  Build.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        description = json['description'],
        stat1 = json['stat1'],
        stat2 = json['stat2'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'stat1': stat1,
      'stat2': stat2,
    };
  }

  String showBuild() {
    return "$name\n$description\n$stat1\n$stat2\n";
  }
}
