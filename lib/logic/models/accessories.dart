import 'dart:convert';

class Accesories {
  int radio;
  int television;
  int airbags;
  int speackers;
  int cigaretteLighter;
  int horn;
  int wipperMotor;
  int washerBumper;
  int afterMarketAccesories;
  Accesories({
    required this.radio,
    required this.television,
    required this.airbags,
    required this.speackers,
    required this.cigaretteLighter,
    required this.horn,
    required this.wipperMotor,
    required this.washerBumper,
    required this.afterMarketAccesories,
  });

  Map<String, dynamic> toMap() {
    return {
      'radio': radio,
      'television': television,
      'airbags': airbags,
      'speackers': speackers,
      'cigaretteLighter': cigaretteLighter,
      'horn': horn,
      'wipperMotor': wipperMotor,
      'washerBumper': washerBumper,
      'afterMarketAccesories': afterMarketAccesories,
    };
  }

 

  factory Accesories.fromMap(Map<String, dynamic> map) {
    return Accesories(
      radio: map['radio']?.toInt() ?? 0,
      television: map['television']?.toInt() ?? 0,
      airbags: map['airbags']?.toInt() ?? 0,
      speackers: map['speackers']?.toInt() ?? 0,
      cigaretteLighter: map['cigaretteLighter']?.toInt() ?? 0,
      horn: map['horn']?.toInt() ?? 0,
      wipperMotor: map['wipperMotor']?.toInt() ?? 0,
      washerBumper: map['washerBumper']?.toInt() ?? 0,
      afterMarketAccesories: map['afterMarketAccesories']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Accesories.fromJson(String source) =>
      Accesories.fromMap(json.decode(source));
}

  accesories() {
    return [
      'radio',
      'television',
      'airbags',
      'speackers',
      'cigaretteLighter',
      'horn',
      'wipperMotor',
      'washerBumper',
      'afterMarketAccesories',
    ];
  }