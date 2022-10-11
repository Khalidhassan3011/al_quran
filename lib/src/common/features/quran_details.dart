part of '../../al_quran.dart';

class _QuranDetails {
  /// get fullQuran
  /// it returns a list of surahs
  /// the length of list is 114 means all surah of quran
  List<Surah> get getFullQuran => _FullQuran().quran;

  /// get full juz
  _FullJuz get getFullJuz => _FullJuz();

  // get all ruku by verse
  // 0 index means 1 ruku
  List<List<Ayat>> get getAllVerseByRuku => _AllRuku().allRukus;

  /// get all sajdah
  _AllSajdah get getAllSajdahVerse => _AllSajdah();

  /// count of quran [surah, juz...]
  _Count get count => _Count();
}

class _FullQuran {
  List<Surah> get quran {
    List<Surah> temp = [];

    for (var element in FullQuranData.full) {
      temp.add(Surah.fromJson(element));
    }

    return temp;
  }
}

class _FullJuz {
  List<List<Surah>> get bySurah {
    List<List<Surah>> temp = [];

    for (Map<String, dynamic> juz in JuzData.juz) {
      List<Surah> surahByJuz = [];

      for (int surahNumber in juz["surahs"]) {
        Surah selectedSurah = AlQuran.surahDetails.bySurahNumber(surahNumber);

        selectedSurah.ayahs.removeRange(juz["verses"][surahNumber][1], selectedSurah.ayahs.length);
        selectedSurah.ayahs.removeRange(0, juz["verses"][surahNumber][0] - 1);

        surahByJuz.add(selectedSurah);
      }

      temp.add(surahByJuz);
    }

    return temp;
  }

  List<List<Ayat>> get byVerse {
    List<List<Ayat>> temp = [];

    for (Map<String, dynamic> juz in JuzData.juz) {
      List<Ayat> perJuzAyat = [];

      for (int surahNumber in juz["surahs"]) {
        Surah selectedSurah = AlQuran.surahDetails.bySurahNumber(surahNumber);

        for (int start = juz["verses"][surahNumber][0] - 1; start < juz["verses"][surahNumber][1]; start++) {
          perJuzAyat.add(selectedSurah.ayahs[start]);
        }
      }
      temp.add(perJuzAyat);
    }
    return temp;
  }
}

class _AllSajdah {
  List<Surah> get bySurah {
    List<Surah> temp = [];

    for (Map<String, int> data in SajdahData.data) {
      Surah selectedSurah = AlQuran.surahDetails.bySurahNumber(data["surah"]!);
      Ayat sajdahAyat = selectedSurah.ayahs[data["verse"]! - 1];
      selectedSurah.ayahs.clear();
      selectedSurah.ayahs.add(sajdahAyat);

      temp.add(selectedSurah);
    }

    return temp;
  }

  List<Ayat> get byVerse {
    List<Ayat> temp = [];

    for (Map<String, int> data in SajdahData.data) {
      temp.add(AlQuran.surahDetails.bySurahNumber(data["surah"]!).ayahs[data["verse"]! - 1]);
    }

    return temp;
  }
}

class _AllRuku {
  List<List<Ayat>> get allRukus {
    List<List<Ayat>> temp = [];

    List<Ayat> perRukuAyat = [];
    for (Surah surah in _FullQuran().quran) {
      for (Ayat ayat in surah.ayahs) {
        if (perRukuAyat.isEmpty) {
          perRukuAyat.add(ayat);
          continue;
        }

        if (ayat.ruku != perRukuAyat.last.ruku) {
          temp.add(perRukuAyat);
          perRukuAyat = [];
          perRukuAyat.add(ayat);
        } else {
          perRukuAyat.add(ayat);
        }
      }
    }

    return temp..add(perRukuAyat);
  }
}

class _Count {
  // constant value
  /// reference - AL QURAN
  int get surah => 114;

  // constant value
  /// reference - AL QURAN
  int get para => 30;

  int get juz => para;

  // constant value
  /// reference - AL QURAN
  int get makkiSurah => 89;

  // constant value
  /// reference - AL QURAN
  int get madaniSurah => 25;

  // constant value
  /// reference - AL QURAN
  int get verseOfSajdah => 15;

  int get ayatOfSajdah => verseOfSajdah;

  // constant value
  /// reference - AL QURAN
  int get ruku => 556;

  /// reference : https://en.wikipedia.org/wiki/%C4%80yah
  /*
  A common perception is that the number of verses in the Quran is 6,666.[6] In fact,
  the total number of verses in the Quran is 6,236 excluding Bismillah and 6349 including Bismillah.
  (There are 114 chapters in the Quran, however there are only 113 Bismillah's because
  Surah At-Tawbah does not have one at the beginning and even though the one
  at the beginning of Surah Al-Fatiha is its first verse hence part of it),
  there is another Bismillah in the middle of ayah 30 of Surah An-Naml .
   */

  // constant value
  /// reference - AL QURAN
  int get ayat => 6236;

  int get verse => ayat;

  // constant value
  /// reference - AL QURAN
  int get page => 604;

  // constant value
  /// reference - AL QURAN
  int get words => 77430;

  /// get total surah count in a single page
  /* Example
      format: AlQuran.count.surahOnPage(page number)

      AlQuran.count.surahOnPage(1)
      --> it will return a integer number
   */

  /* NB
      [pageNumber] must be valid otherwise function throw an error
   */
  int surahOnPage(int pageNumber) {
    // throw error for invalid pageNumber
    if (!Utils.isPageNumberValid(pageNumber)) throw AppStrings.invalidPageNumber;

    return PageData.page[pageNumber - 1].length;
  }

  /// get total verse count in a single page
  /* Example
      format: AlQuran.count.verseOnPage(page number)

      AlQuran.count.verseOnPage(1)
      --> it will return a integer number
   */

  /* NB
      [pageNumber] must be valid otherwise function throw an error
   */
  int verseOnPage(int pageNumber) {
    // throw error for invalid pageNumber
    if (!Utils.isPageNumberValid(pageNumber)) throw AppStrings.invalidPageNumber;

    int verseCount = 0;
    for (Map<String, int> element in PageData.page[pageNumber - 1]) {
      verseCount += element["end"]! - element["start"]! + 1;
    }

    return verseCount;
  }
}
