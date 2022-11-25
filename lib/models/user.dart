// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String name;
  final String email;
  final String id;
  final String password;
  final String type;
  final String token;
  final String address;

  User({
    required this.name,
    required this.email,
    required this.id,
    required this.password,
    required this.type,
    required this.token,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
      'password': password,
      'type': type,
      'token': token,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      id: map['_id'] as String,
      password: map['password'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, email: $email, id: $id, password: $password, type: $type, token: $token, address: $address )';
  }

  User copyWith({
    String? name,
    String? email,
    String? id,
    String? password,
    String? type,
    String? token,
    String? address,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      password: password ?? this.password,
      type: type ?? this.type,
      token: token ?? this.token,
      address: address ?? this.address,
    );
  }
}
