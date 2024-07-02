class Character {
  final int id;
  final String name;
  final String gender;
  final String location;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.gender,
    required this.location,
    required this.image,
  });

  Character.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()), // Convertir id a entero
        name = json['name'],
        gender = json['gender'],
        location = json['location']['name'], // Corregido aquí
        image = json['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'location': location, // Corregido aquí
      'image': image
    };
  }

  static Character fromMap(Map<String, dynamic> map) {
    return Character(
      id: int.parse(map['id'].toString()), // Convertir id a entero
      name: map['name'],
      gender: map['gender'],
      location: map['location'], // Corregido aquí
      image: map['image'],
    );
  }
}
