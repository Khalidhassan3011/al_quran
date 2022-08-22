import 'dart:convert';

class Ayat {
  Ayat({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.translateBn,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajdah,
    required this.pronunciationBn,
    required this.wordsArabic,
    required this.wordsBangla,
  });

  // number of ayat / verse on full quran
  final int number;

  // audio link
  // it collect form online. so sometime it will not work
  final String? audio;

  // different server audio link
  // it collect form online. so sometime it will not work
  final List<String> audioSecondary;

  // text in arabic
  final String text;

  // bangla translation
  final String translateBn;

  // verse / ayat number of surah
  final int numberInSurah;

  // juz / para number
  final int juz;

  // manzil
  final int manzil;

  // page number which contains current verse / ayat
  final int page;

  // ruku
  final int ruku;

  // hizbQuarter
  final int hizbQuarter;

  // sajdah returns [false or object]
  final dynamic sajdah;

  // bangla pronunciation
  final String pronunciationBn;

  // full verse / ayat text separate with words in arabic
  final String wordsArabic;

  // full verse / ayat translation separate with words in bangla
  final String wordsBangla;

  factory Ayat.fromRawJson(String str) => Ayat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        number: json["number"],
        audio: json["audio"],
        audioSecondary: List<String>.from((json["audioSecondary"] ?? []).map((x) => x)),
        text: json["text"],
        translateBn: json["translate_bn"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajdah: json["sajda"],
        pronunciationBn: json["pronunciation_bn"],
        wordsArabic: json["words_arabic"],
        wordsBangla: json["words_bangla"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "audio": audio,
        "audioSecondary": List<dynamic>.from(audioSecondary.map((x) => x)),
        "text": text,
        "translate_bn": translateBn,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajdah,
        "pronunciation_bn": pronunciationBn,
        "words_arabic": wordsArabic,
        "words_bangla": wordsBangla,
      };
}
