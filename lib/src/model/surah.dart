import 'dart:convert';

import '../enum/revelation_type.dart';
import 'ayat.dart';
import 'surah_basic_info.dart';

class Surah extends SurahBasicInfo {
  Surah({
    required this.ayahs,
    required int number,
    required String name,
    required String englishName,
    required String englishNameTranslation,
    required RevelationType revelationType,
    required int verse,
    required int words,
    required int chars,
  }) : super(
          number: number,
          name: name,
          englishName: englishName,
          englishNameTranslation: englishNameTranslation,
          revelationType: revelationType,
          verse: verse,
          words: words,
          chars: chars,
        );

  // list of ayat / verse
  final List<Ayat> ayahs;

  factory Surah.fromRawJson(String str) => Surah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: revelationTypeValues.map[json["revelationType"]]!,
        verse: json["verse"],
        words: json["words"],
        chars: json["chars"],
        ayahs: List<Ayat>.from(json["ayahs"].map((x) => Ayat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationTypeValues.reverse[revelationType],
        "verse": verse,
        "words": words,
        "chars": chars,
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
      };
}
