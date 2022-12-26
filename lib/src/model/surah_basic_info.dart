import 'dart:convert';

import '../enum/revelation_type.dart';

class SurahBasicInfo {
  SurahBasicInfo({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.verse,
    required this.words,
    required this.chars,
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

  factory SurahBasicInfo.fromRawJson(String str) => SurahBasicInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SurahBasicInfo.fromJson(Map<String, dynamic> json) => SurahBasicInfo(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    revelationType: revelationTypeValues.map[json["revelationType"]]!,
    verse: json["verse"],
    words: json["words"],
    chars: json["chars"],
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
  };
}
