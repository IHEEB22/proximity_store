class Sector {
  final String sectorName;

  final bool sectorCheked;

  Sector({
    required this.sectorName,
    required this.sectorCheked,
  });
  // setSectorCheked() {
  //   this.sectorCheked = !this.sectorCheked;
  // }

  factory Sector.fromJson(Map<String, dynamic> json) {
    final sectorName = json['sector_name'] as String;
    final sectorCheked = json['sector_chheked'] as bool;

    return Sector(
      sectorName: sectorName,
      sectorCheked: sectorCheked,
    );
  }
}
