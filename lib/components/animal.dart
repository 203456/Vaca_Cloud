import 'dart:convert';

List<Animal> animalFromJson(String str) => animalListFromJson(json.decode(str));

List<Animal> animalListFromJson(Map<String, dynamic> json) {
  final List<dynamic> results = json['results'];
  return results.map((animalJson) => Animal.fromJson(animalJson)).toList();
}

class Animal {
  Animal({
    this.name,
    this.animal,
    this.photo,
    this.id,
    this.race,
    this.number,
    this.birthdate,
    this.owner,
  });

  String? name;
  String? animal;
  String? photo;
  int? id;
  String? race;
  String? number;
  String? birthdate;
  int? owner;

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
      name: json["name"],
      animal: json["animal"],
      photo: json["photo"],
      id: json["id"],
      race: json["race"],
      number: json["number"],
      birthdate: json["birthdate"],
      owner: json["owner"]);
}
