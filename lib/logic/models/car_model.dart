import 'dart:convert';

import 'package:car_rank/logic/models/accessories.dart';
import 'package:car_rank/logic/models/electricals.dart';
import 'package:car_rank/logic/models/engine_model.dart';
import 'package:car_rank/logic/models/interior.dart';
import 'package:car_rank/logic/models/stearing.dart';
import 'package:car_rank/logic/models/transmission.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
  String userName;
  String userEmail;
  String name;
  String id;
  String model;
  String image;
  String price;
  String year;
  String mileage;
  String color;
  String fuel;
  String description;
  EngineModel engineRating;
  Transmission transmissionRating;
  Electricals electricRating;
  Stearing stearing;
  Interior interiorRating;
  Accesories accessoriesRating;
  CarModel({
    required this.userName,
    required this.userEmail,
    required this.name,
    required this.id,
    required this.model,
    required this.image,
    required this.price,
    required this.year,
    required this.mileage,
    required this.color,
    required this.fuel,
    required this.description,
    required this.engineRating,
    required this.transmissionRating,
    required this.electricRating,
    required this.stearing,
    required this.interiorRating,
    required this.accessoriesRating,
  });

  Map<String, dynamic> toSnapshot() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'name': name,
      'id': id,
      'model': model,
      'image': image,
      'price': price,
      'year': year,
      'mileage': mileage,
      'color': color,
      'fuel': fuel,
      'description': description,
      'engineRating': engineRating.toMap(),
      'transmissionRating': transmissionRating.toMap(),
      'electricRating': electricRating.toMap(),
      'stearing': stearing.toMap(),
      'interiorRating': interiorRating.toMap(),
      'accessoriesRating': accessoriesRating.toMap(),
    };
  }

  factory CarModel.fromSnapshot(DocumentSnapshot map) {
    return CarModel(
      userName: map['userName'] ?? '',
      userEmail: map['userEmail'] ?? '',
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      model: map['model'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      year: map['year'] ?? '',
      mileage: map['mileage'] ?? '',
      color: map['color'] ?? '',
      fuel: map['fuel'] ?? '',
      description: map['description'] ?? '',
      engineRating: EngineModel.fromMap(map['engineRating']),
      transmissionRating: Transmission.fromMap(map['transmissionRating']),
      electricRating: Electricals.fromMap(map['electricRating']),
      stearing: Stearing.fromMap(map['stearing']),
      interiorRating: Interior.fromMap(map['interiorRating']),
      accessoriesRating: Accesories.fromMap(map['accessoriesRating']),
    );
  }

  String toJson() => json.encode(toSnapshot());

  factory CarModel.fromJson(String source) => CarModel.fromSnapshot(json.decode(source));
}
