import 'dart:convert';

class EngineModel {
  int noises;
  int corrotion;
  int belts;
  int hoses;
  int operation;
  int serviceHistory;
  int efficiency;
  int exhaust;
  int powerProducedByEachGear;
  int overhauled;
  int steaming;
  int knock;
  int idling;
  int compresionTest;
  EngineModel({
    required this.noises,
    required this.corrotion,
    required this.belts,
    required this.hoses,
    required this.operation,
    required this.serviceHistory,
    required this.efficiency,
    required this.exhaust,
    required this.powerProducedByEachGear,
    required this.overhauled,
    required this.steaming,
    required this.knock,
    required this.idling,
    required this.compresionTest,
  });

  Map<String, dynamic> toMap() {
    return {
      'noises': noises,
      'corrotion': corrotion,
      'belts': belts,
      'hoses': hoses,
      'operation': operation,
      'serviceHistory': serviceHistory,
      'efficiency': efficiency,
      'exhaust': exhaust,
      'powerProducedByEachGear': powerProducedByEachGear,
      'overhauled': overhauled,
      'steaming': steaming,
      'knock': knock,
      'idling': idling,
      'compresionTest': compresionTest,
    };
  }

  factory EngineModel.fromMap(Map<String, dynamic> map) {
    return EngineModel(
      noises: map['noises']?.toInt() ?? 0,
      corrotion: map['corrotion']?.toInt() ?? 0,
      belts: map['belts']?.toInt() ?? 0,
      hoses: map['hoses']?.toInt() ?? 0,
      operation: map['operation']?.toInt() ?? 0,
      serviceHistory: map['serviceHistory']?.toInt() ?? 0,
      efficiency: map['efficiency']?.toInt() ?? 0,
      exhaust: map['exhaust']?.toInt() ?? 0,
      powerProducedByEachGear: map['powerProducedByEachGear']?.toInt() ?? 0,
      overhauled: map['overhauled']?.toInt() ?? 0,
      steaming: map['steaming']?.toInt() ?? 0,
      knock: map['knock']?.toInt() ?? 0,
      idling: map['idling']?.toInt() ?? 0,
      compresionTest: map['compresionTest']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EngineModel.fromJson(String source) => EngineModel.fromMap(json.decode(source));
}

List<String> engineModelList() {
    return [
      'noises',
      'corrotion',
      'belts',
      'hoses',
      'operation',
      'serviceHistory',
      'efficiency',
      'exhaust',
      'powerProducedByEachGear',
      'overhauled',
      'steaming',
      'knock',
      'idling',
      'compresionTest',
    ];
  }