import 'dart:convert';

class Electricals {
  int fogLihts;
  int indicators;
  int harzardLights;
  int parkingLights;
  int rearFogLights;
  int headLights;
  int dashboard;
  int tail;
  int interorLights;
  int starter;
  int battery;
  int altonator;
  int oilPressureSwitch;
  int temperatureGauge;
  Electricals({
    required this.fogLihts,
    required this.indicators,
    required this.harzardLights,
    required this.parkingLights,
    required this.rearFogLights,
    required this.headLights,
    required this.dashboard,
    required this.tail,
    required this.interorLights,
    required this.starter,
    required this.battery,
    required this.altonator,
    required this.oilPressureSwitch,
    required this.temperatureGauge,
  });

  Map<String, dynamic> toMap() {
    return {
      'fogLihts': fogLihts,
      'indicators': indicators,
      'harzardLights': harzardLights,
      'parkingLights': parkingLights,
      'rearFogLights': rearFogLights,
      'headLights': headLights,
      'dashboard': dashboard,
      'tail': tail,
      'interorLights': interorLights,
      'starter': starter,
      'battery': battery,
      'altonator': altonator,
      'oilPressureSwitch': oilPressureSwitch,
      'temperatureGauge': temperatureGauge,
    };
  }

  List electricals() {
    return [
      'fogLihts',
      'indicators',
      'harzardLights',
      'parkingLights',
      'rearFogLights',
      'headLights',
      'dashboard',
      'tail',
      'interorLights',
      'starter',
      'battery',
      'altonator',
      'oilPressureSwitch',
      'temperatureGauge',
    ];
  }

  factory Electricals.fromMap(Map<String, dynamic> map) {
    return Electricals(
      fogLihts: map['fogLihts']?.toInt() ?? 0,
      indicators: map['indicators']?.toInt() ?? 0,
      harzardLights: map['harzardLights']?.toInt() ?? 0,
      parkingLights: map['parkingLights']?.toInt() ?? 0,
      rearFogLights: map['rearFogLights']?.toInt() ?? 0,
      headLights: map['headLights']?.toInt() ?? 0,
      dashboard: map['dashboard']?.toInt() ?? 0,
      tail: map['tail']?.toInt() ?? 0,
      interorLights: map['interorLights']?.toInt() ?? 0,
      starter: map['starter']?.toInt() ?? 0,
      battery: map['battery']?.toInt() ?? 0,
      altonator: map['altonator']?.toInt() ?? 0,
      oilPressureSwitch: map['oilPressureSwitch']?.toInt() ?? 0,
      temperatureGauge: map['temperatureGauge']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Electricals.fromJson(String source) =>
      Electricals.fromMap(json.decode(source));
}



 electricals() {
    return [
      'fogLihts',
      'indicators',
      'harzardLights',
      'parkingLights',
      'rearFogLights',
      'headLights',
      'dashboard',
      'tail',
      'interorLights',
      'starter',
      'battery',
      'altonator',
      'oilPressureSwitch',
      'temperatureGauge',
    ];
  }