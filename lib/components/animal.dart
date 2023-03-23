import 'dart:convert';


List<Animal> animalFromJson(String str) => List<Animal>.from(json.decode(str).map((x) => Animal.fromJson(x)));

class Animal {
  Animal({
    this.name,
    this.animal,
    this.photo,
    this.id,
    this.race,
    this.number,
    this.birthdate,
  });

  String? name;
  String? animal;
  String? photo;
  int? id;
  String? race;
  String? number;
  String? birthdate;


  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    name: json["name"],
    animal: json["animal"],
    photo: json["photo"],
    id: json["id"],
    race: json["race"],
    number: json["number"],
    birthdate: json["birthdate"],
  );


}

