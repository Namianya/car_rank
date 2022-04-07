import 'dart:convert';

class Interior {
  int roofInterior;
  int visors;
  int headrests;
  int seates;
  int doorHandles;
  int gloveBox;
  int airVents;
  int dashboard;
  int floorCarpet;
  Interior({
    required this.roofInterior,
    required this.visors,
    required this.headrests,
    required this.seates,
    required this.doorHandles,
    required this.gloveBox,
    required this.airVents,
    required this.dashboard,
    required this.floorCarpet,
  });

  Map<String, dynamic> toMap() {
    return {
      'roofInterior': roofInterior,
      'visors': visors,
      'headrests': headrests,
      'seates': seates,
      'doorHandles': doorHandles,
      'gloveBox': gloveBox,
      'airVents': airVents,
      'dashboard': dashboard,
      'floorCarpet': floorCarpet,
    };
  }

 

  factory Interior.fromMap(Map<String, dynamic> map) {
    return Interior(
      roofInterior: map['roofInterior']?.toInt() ?? 0,
      visors: map['visors']?.toInt() ?? 0,
      headrests: map['headrests']?.toInt() ?? 0,
      seates: map['seates']?.toInt() ?? 0,
      doorHandles: map['doorHandles']?.toInt() ?? 0,
      gloveBox: map['gloveBox']?.toInt() ?? 0,
      airVents: map['airVents']?.toInt() ?? 0,
      dashboard: map['dashboard']?.toInt() ?? 0,
      floorCarpet: map['floorCarpet']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Interior.fromJson(String source) =>
      Interior.fromMap(json.decode(source));
}


 interior() {
    return [
      'roofInterior',
      'visors',
      'headrests',
      'seates',
      'doorHandles',
      'gloveBox',
      'airVents',
      'dashboard',
      'floorCarpet',
    ];
  }