import '../../al_quran.dart';

class Utils {
  /// validate [surahNumber]
  static bool isSurahNumberValid(int surahNumber) => surahNumber > 0 && surahNumber <= AlQuran.quranDetails.count.surah;

  /// validate [juzNumber]
  static bool isJuzNumberValid(int juzNumber) => juzNumber > 0 && juzNumber <= AlQuran.quranDetails.count.para;

  /// validate [verseNumber]
  static bool isVerseNumberValid(int verseNumber) => verseNumber > 0 && verseNumber <= AlQuran.quranDetails.count.verse;

  /// validate [pageNumber]
  static bool isPageNumberValid(int pageNumber) => pageNumber > 0 && pageNumber <= AlQuran.quranDetails.count.page;
}
