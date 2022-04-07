import 'dart:convert';

class BodyConditionModel {
  int bonnet;
  int frontBumber;
  int rearBumber;
  int fenders;
  int crowlpanel;
  int doors;
  int rocketpanels;
  int wheelArchPanel;
  int wheelHouse;
  int headerPanel;
  int roofPanel;
  int frontWindShield;
  int rearWindShield;
  int mirrors;
  int trunk;
  int mudGuard;
  int paint;
  int tailGate;
  BodyConditionModel({
    required this.bonnet,
    required this.frontBumber,
    required this.rearBumber,
    required this.fenders,
    required this.crowlpanel,
    required this.doors,
    required this.rocketpanels,
    required this.wheelArchPanel,
    required this.wheelHouse,
    required this.headerPanel,
    required this.roofPanel,
    required this.frontWindShield,
    required this.rearWindShield,
    required this.mirrors,
    required this.trunk,
    required this.mudGuard,
    required this.paint,
    required this.tailGate,
  });

  Map<String, dynamic> toMap() {
    return {
      'bonnet': bonnet,
      'frontBumber': frontBumber,
      'rearBumber': rearBumber,
      'fenders': fenders,
      'crowlpanel': crowlpanel,
      'doors': doors,
      'rocketpanels': rocketpanels,
      'wheelArchPanel': wheelArchPanel,
      'wheelHouse': wheelHouse,
      'headerPanel': headerPanel,
      'roofPanel': roofPanel,
      'frontWindShield': frontWindShield,
      'rearWindShield': rearWindShield,
      'mirrors': mirrors,
      'trunk': trunk,
      'mudGuard': mudGuard,
      'paint': paint,
      'tailGate': tailGate,
    };
  }

  List bodyCondition() {
    return [
      'bonnet',
      'frontBumber',
      'rearBumber',
      'fenders',
      'crowlpanel',
      'doors',
      'rocketpanels',
      'wheelArchPanel',
      'wheelHouse',
      'headerPanel',
      'roofPanel',
      'frontWindShield',
      'rearWind Shield',
      'mirrors',
      'trunk',
      'mudGuard',
      'paint',
      'tailGate',
    ];
  }

  factory BodyConditionModel.fromMap(Map<String, dynamic> map) {
    return BodyConditionModel(
      bonnet: map['bonnet']?.toInt() ?? 0,
      frontBumber: map['frontBumber']?.toInt() ?? 0,
      rearBumber: map['rearBumber']?.toInt() ?? 0,
      fenders: map['fenders']?.toInt() ?? 0,
      crowlpanel: map['crowlpanel']?.toInt() ?? 0,
      doors: map['doors']?.toInt() ?? 0,
      rocketpanels: map['rocketpanels']?.toInt() ?? 0,
      wheelArchPanel: map['wheelArchPanel']?.toInt() ?? 0,
      wheelHouse: map['wheelHouse']?.toInt() ?? 0,
      headerPanel: map['headerPanel']?.toInt() ?? 0,
      roofPanel: map['roofPanel']?.toInt() ?? 0,
      frontWindShield: map['frontWindShield']?.toInt() ?? 0,
      rearWindShield: map['rearWindShield']?.toInt() ?? 0,
      mirrors: map['mirrors']?.toInt() ?? 0,
      trunk: map['trunk']?.toInt() ?? 0,
      mudGuard: map['mudGuard']?.toInt() ?? 0,
      paint: map['paint']?.toInt() ?? 0,
      tailGate: map['tailGate']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BodyConditionModel.fromJson(String source) =>
      BodyConditionModel.fromMap(json.decode(source));
}
