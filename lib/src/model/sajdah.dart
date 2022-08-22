import 'dart:convert';

class Sajdah {
  Sajdah({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });

  // count of verse / ayat [1 - 15]
  final int id;

  final bool recommended;

  final bool obligatory;

  factory Sajdah.fromRawJson(String str) => Sajdah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sajdah.fromJson(Map<String, dynamic> json) => Sajdah(
    id: json["id"],
    recommended: json["recommended"],
    obligatory: json["obligatory"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "recommended": recommended,
    "obligatory": obligatory,
  };
}