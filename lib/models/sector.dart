import 'package:flutter/cupertino.dart';

class Sector {
  final String sectorName;

  bool sectorCheked;

  Sector({
    required this.sectorName,
    required this.sectorCheked,
  });

  factory Sector.fromJson(Map<String, dynamic> json) {
    final sectorName = json['sector_name'] as String;
    bool sectorCheked = json['sector_cheked'] as bool;

    return Sector(
      sectorName: sectorName,
      sectorCheked: sectorCheked,
    );
  }
}
