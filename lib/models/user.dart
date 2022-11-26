// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String username;
  final String? id;
  final String phoneNumber;
  final String password;
  final String? type;
  final String? token;
  final String? address;

  User({
    required this.username,
    this.id,
    required this.phoneNumber,
    required this.password,
    this.type,
    this.token,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'id': id,
      'phoneNumber': phoneNumber,
      'password': password,
      'type': type,
      'token': token,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['name'] as String,
      id: map['_id'] as String,
      phoneNumber: map['phoneNumber'] as String,
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
    return 'User(name: $username, id: $id, phoneNumber: $phoneNumber , password: $password, type: $type, token: $token, address: $address )';
  }

  User copyWith({
    String? name,
    String? id,
    String? phoneNumber,
    String? password,
    String? type,
    String? token,
    String? address,
  }) {
    return User(
      username: name ?? this.username,
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      type: type ?? this.type,
      token: token ?? this.token,
      address: address ?? this.address,
    );
  }
}
