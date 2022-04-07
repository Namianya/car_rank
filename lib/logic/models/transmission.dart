import 'dart:convert';

class Transmission {
  int nioses;
  int leaks;
  int transmissionHousing;
  int transmisionBrake;
  int transferBox;
  int propellerShaft;
  int difrential;
  int axels;
  int clutch;
  int presureplate;
  int clutchMasterCilinder;
  int speedometerDrive;
  int cableClutchLickage;
  int electtronicControlledClutch;
  int manualTransmission;
  int manualTransAxle;
  int automaticTransmission;
  int continuousVariableTransmission;
  Transmission({
    required this.nioses,
    required this.leaks,
    required this.transmissionHousing,
    required this.transmisionBrake,
    required this.transferBox,
    required this.propellerShaft,
    required this.difrential,
    required this.axels,
    required this.clutch,
    required this.presureplate,
    required this.clutchMasterCilinder,
    required this.speedometerDrive,
    required this.cableClutchLickage,
    required this.electtronicControlledClutch,
    required this.manualTransmission,
    required this.manualTransAxle,
    required this.automaticTransmission,
    required this.continuousVariableTransmission,
  });

  Map<String, dynamic> toMap() {
    return {
      'nioses': nioses,
      'leaks': leaks,
      'transmissionHousing': transmissionHousing,
      'transmisionBrake': transmisionBrake,
      'transferBox': transferBox,
      'propellerShaft': propellerShaft,
      'difrential': difrential,
      'axels': axels,
      'clutch': clutch,
      'presureplate': presureplate,
      'clutchMasterCilinder': clutchMasterCilinder,
      'speedometerDrive': speedometerDrive,
      'cableClutchLickage': cableClutchLickage,
      'electtronicControlledClutch': electtronicControlledClutch,
      'manualTransmission': manualTransmission,
      'manualTransAxle': manualTransAxle,
      'automaticTransmission': automaticTransmission,
      'continuousVariableTransmission': continuousVariableTransmission,
    };
  }

  factory Transmission.fromMap(Map<String, dynamic> map) {
    return Transmission(
      nioses: map['nioses']?.toInt() ?? 0,
      leaks: map['leaks']?.toInt() ?? 0,
      transmissionHousing: map['transmissionHousing']?.toInt() ?? 0,
      transmisionBrake: map['transmisionBrake']?.toInt() ?? 0,
      transferBox: map['transferBox']?.toInt() ?? 0,
      propellerShaft: map['propellerShaft']?.toInt() ?? 0,
      difrential: map['difrential']?.toInt() ?? 0,
      axels: map['axels']?.toInt() ?? 0,
      clutch: map['clutch']?.toInt() ?? 0,
      presureplate: map['presureplate']?.toInt() ?? 0,
      clutchMasterCilinder: map['clutchMasterCilinder']?.toInt() ?? 0,
      speedometerDrive: map['speedometerDrive']?.toInt() ?? 0,
      cableClutchLickage: map['cableClutchLickage']?.toInt() ?? 0,
      electtronicControlledClutch:
          map['electtronicControlledClutch']?.toInt() ?? 0,
      manualTransmission: map['manualTransmission']?.toInt() ?? 0,
      manualTransAxle: map['manualTransAxle']?.toInt() ?? 0,
      automaticTransmission: map['automaticTransmission']?.toInt() ?? 0,
      continuousVariableTransmission:
          map['continuousVariableTransmission']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transmission.fromJson(String source) =>
      Transmission.fromMap(json.decode(source));
}

transmission() {
  return [
    'nioses',
    'leaks',
    'transmissionHousing',
    'transmisionBrake',
    'transferBox',
    'propellerShaft',
    'difrential',
    'axels',
    'clutch',
    'presureplate',
    'clutchMasterCilinder',
    'speedometerDrive',
    'cableClutchLickage',
    'electtronicControlledClutch',
    'manualTransmission',
    'manualTransAxle',
    'automaticTransmission',
    'continuousVariableTransmission',
  ];
}
