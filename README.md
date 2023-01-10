# ওয়াল কুরআ-নিল হাকীম - وَٱلْقُرْءَانِ ٱلْحَكِيم
A simple Quran package for flutter with arabic text, english translation, bangla language and pronunciation.
Also available audio link, revelation type and other information. 

#### Platform Support

| Android  | iOS  | Linux | MacOS | Web   | Windows |
|----------|------|-------|-------|-------|---------|
|     ✔    |   ✔  |   ✔   |  ✔    |   ✔   |    ✔    |


#### Inspiration From
- [Quranil Hakim](https://quran.com/en)
- [Quran package](https://pub.dev/packages/quran)


#### Reference
[Full quran](https://alquran.cloud/api)  &nbsp;⬥&nbsp;
[Sajdah](https://quran411.com/sajdah-places-in-quran)  &nbsp;⬥&nbsp;
[Juz data, Page data](https://pub.dev/packages/quran)  &nbsp;⬥&nbsp;
[Word count, Letter count ...](https://en.wikipedia.org/wiki/%C4%80yah)

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml  
dependencies:  
    ... 
    al_quran: ^0.1.1+5
```  

Import it:
```dart  
import 'package:al_quran/al_quran.dart';
```  

## Usage Examples

```dart  
// just call AlQuran object and access all properties  
// NB: use a arabic font if text not show properly  
  
Text("Total Surah: ${AlQuran.quranDetails.count.surah}"),  
```  
For more details, Please visit [Example](https://pub.dev/packages/al_quran/example)


## Objects

you can convert any model to map </br>
it will return a `Map<String, dynamic>` </br>
`Ex: [Model Name].toJson();`

#### Surah Basic Info
```dart  
class SurahBasicInfo {
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
}
``` 

#### Surah
```dart  
class Surah {
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
}
``` 

#### Ayat / Verse
```dart  
class Ayat {
  // number of ayat / verse on full quran
  final int number;
  
  // audio link
  // it collect form online. so sometime it will not work
  final String audio;

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
}
``` 

#### Sajdah
```dart  
class Sajdah {
  // count of verse / ayat [1 - 15]
  final int id;
  
  final bool recommended;
  
  final bool obligatory;
}
``` 

#### How to use

```dart  
AlQuran.[FEATURES].[AVAILABLE PROPERTIES].[PROPERTIES]

/// convert any digit in bangla or arabic

// english 123 to bangla ১২৩
Text(123.bn)

// english 123 to arabic ١٢٣
Text(123.ar)
``` 
    
    
    |―――――――――――――――|―――――――――――――――――――――――――――――――――――|―――――――――――――――――――――――――――――――――――|――――――――――――――――――――――――|
    | FEATURES      |  AVAILABLE PROPERTIES             |       PROPERTIES                  |   RETURN TYPE          |
    |===============|===================================|===================================|========================|
    |  getBismillah |   ar                              |                                   |   String               |
    |               |   bn                              |                                   |   String               |
    |               |   unicode                         |                                   |   String               |
    |---------------|-----------------------------------|-----------------------------------|------------------------|                
    |  quranDetails |   getFullQuran                    |                                   |   List<Surah>          |
    |               |-----------------------------------|-----------------------------------|------------------------|
    |               |   getAllSurahBasicInfo            |                                   |   List<SurahBasicInfo> |
    |               |-----------------------------------|-----------------------------------|------------------------|
    |               |   getFullJuz                      |  bySurah                          |   List<List<Surah>>    |
    |               |                                   |  byVerse                          |   List<List<Ayat>>     |
    |               |-----------------------------------|-----------------------------------|------------------------|
    |               |   getAllSajdahVerse               |  bySurah                          |   List<Surah>          |
    |               |                                   |  byVerse                          |   List<Ayat>           |
    |               |-----------------------------------|-----------------------------------|------------------------|
    |               |   getAllVerseByRuku               |                                   |   List<List<Ayat>>     |
    |               |-----------------------------------|-----------------------------------|------------------------|
    |               |   count                           |  surah                            |   int                  |
    |               |                                   |  para / juz                       |   int                  |
    |               |                                   |  makkiSurah                       |   int                  |
    |               |                                   |  madaniSurah                      |   int                  |
    |               |                                   |  verseOfSajdah /  ayatOfSajdah    |   int                  |
    |               |                                   |  ruku                             |   int                  |
    |               |                                   |  ayat / verse                     |   int                  |
    |               |                                   |  page                             |   int                  |
    |               |                                   |  words                            |   int                  |
    |               |                                   |  surahOnPage(int pageNumber)      |   int                  |
    |               |                                   |  verseOnPage(int pageNumber)      |   int                  |
    |---------------|-----------------------------------|-----------------------------------|------------------------|
    |  surahDetails |   byName                          |                                   |   Surah                |
    |               |   bySurahNumber(int surahNumber)  |                                   |   Surah                |
    |               |   byJuzNumber(int juzNumber)      |                                   |   List<Surah>          |
    |               |   byVerseNumber(int verseNumber)  |                                   |   Surah                |
    |               |   byPageNumber(int pageNumber)    |                                   |   List<Surah>          |
    |---------------|-----------------------------------|-----------------------------------|------------------------|
    


## Request for this package user
If you found any error or bug please report an issue or send me an <a href="mailto:khalidhassan3011@gmail.com">eMail</a> ASAP.


## Visitors Count

<img align="left" src = "https://profile-counter.glitch.me/al_quran/count.svg" alt ="Loading">
