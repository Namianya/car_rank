import 'dart:convert';

class Stearing {
  int innerCvJoint;
  int outerCvJoint;
  int powerStearingPump;
  int tireRods;
  int bushes;
  int ballJoints;
  int steeringRack;
  int stearingBox;
  int leaks;
  int noises;
  int cvJointBoot;
  int steeringWheelPlay;
  Stearing({
    required this.innerCvJoint,
    required this.outerCvJoint,
    required this.powerStearingPump,
    required this.tireRods,
    required this.bushes,
    required this.ballJoints,
    required this.steeringRack,
    required this.stearingBox,
    required this.leaks,
    required this.noises,
    required this.cvJointBoot,
    required this.steeringWheelPlay,
  });

  Map<String, dynamic> toMap() {
    return {
      'innerCvJoint': innerCvJoint,
      'outerCvJoint': outerCvJoint,
      'powerStearingPump': powerStearingPump,
      'tireRods': tireRods,
      'bushes': bushes,
      'ballJoints': ballJoints,
      'steeringRack': steeringRack,
      'stearingBox': stearingBox,
      'leaks': leaks,
      'noises': noises,
      'cvJointBoot': cvJointBoot,
      'steeringWheelPlay': steeringWheelPlay,
    };
  }


  factory Stearing.fromMap(Map<String, dynamic> map) {
    return Stearing(
      innerCvJoint: map['innerCvJoint']?.toInt() ?? 0,
      outerCvJoint: map['outerCvJoint']?.toInt() ?? 0,
      powerStearingPump: map['powerStearingPump']?.toInt() ?? 0,
      tireRods: map['tireRods']?.toInt() ?? 0,
      bushes: map['bushes']?.toInt() ?? 0,
      ballJoints: map['ballJoints']?.toInt() ?? 0,
      steeringRack: map['steeringRack']?.toInt() ?? 0,
      stearingBox: map['stearingBox']?.toInt() ?? 0,
      leaks: map['leaks']?.toInt() ?? 0,
      noises: map['noises']?.toInt() ?? 0,
      cvJointBoot: map['cvJointBoot']?.toInt() ?? 0,
      steeringWheelPlay: map['steeringWheelPlay']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stearing.fromJson(String source) => Stearing.fromMap(json.decode(source));
}

 stearing() {
    return [
      'innerCvJoint',
      'outerCvJoint',
      'powerStearingPump',
      'tireRods',
      'bushes',
      'ballJoints',
      'steeringRack',
      'stearingBox',
      'leaks',
      'noises',
      'cvJointBoot',
      'steeringWheelPlay',
    ];
  }
