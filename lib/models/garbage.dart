import 'dart:convert';

class Garbage {
  final String? id;
  final String name;
  final double price;
  // final String type;
  final String type;
  final String description;
  // final String? imgUrl;

  Garbage({
    this.id,
    required this.name,
    required this.price,
    required this.type,
    required this.description,
    // this.imgUrl,
    // required this.imgUrl,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'type': type,
      'description': description,
      // 'imgUrl': imgUrl,
    };
  }

  factory Garbage.fromMap(Map<String, dynamic> map) {
    return Garbage(
      id: map['_id'],
      name: map['name'],
      price: double.parse(map['price'].toString()),
      type: map['type'],
      description: map['description'],
      // imgUrl: map['imgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Garbage.fromJson(String source) =>
      Garbage.fromMap(json.decode(source) as Map<String, dynamic>);
}
