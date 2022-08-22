import 'dart:convert';

import '../enum/revelation_type.dart';
import 'ayat.dart';

class Surah {
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.verse,
    required this.words,
    required this.chars,
    required this.ayahs,
  });

  // surah number
  final int number;

  // surah name in arabic
  final String name;

  // surah name in english
  final String englishName;

  // surah name translation in english
  final String englishNameTranslation;

  // revelationType will Meccan or Medinan
  final RevelationType revelationType;

  // total verse or ayat in surah
  final int verse;

  // total words in surah
  final int words;

  // total char or letters in surah
  final int chars;

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
