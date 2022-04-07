import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String phoneNumber;
  bool isAdmin;
  String email;
  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.isAdmin,
    required this.email,
  });

  Map<String, dynamic> toSnapshot() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
      'email': email,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot map) {
    return UserModel(
      name: map['name'] ?? 'Username',
      phoneNumber: map['phoneNumber'] ?? '07XXXXXXXX',
      isAdmin: map['isAdmin'] ?? false,
      email: map['email'] ?? 'user@user.com',
    );
  }

  String toJson() => json.encode(toSnapshot());

  factory UserModel.fromJson(String source) => UserModel.fromSnapshot(json.decode(source));
}
