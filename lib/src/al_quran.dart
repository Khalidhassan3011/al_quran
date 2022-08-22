// ignore_for_file: library_private_types_in_public_api

export 'common/extensions.dart';
export 'common/strings.dart';
export 'model/surah.dart';
export 'model/ayat.dart';
import '../al_quran.dart';
import 'common/utils/utils.dart';
import 'data/full_quran_data.dart';
import 'data/page_data.dart';
import 'enum/all_surahs.dart';

import 'data/juz_data.dart';
import 'data/sajdah_data.dart';

part 'common/features/quran_details.dart';
part 'common/features/bismillah.dart';
part 'common/features/surah_details.dart';

class AlQuran {
  /// get bismillah in arabic and bangla
  static _Bismillah get getBismillah => _Bismillah();

  /// get quran details
  /// get constant count of [surah, para/juz, makkiSurah, madaniSurah, ayat/verse, page, words]
  /// get count of [surahOnPage(int pageNumber), verseOnPage(int pageNumber)]
  static _QuranDetails get quranDetails => _QuranDetails();

  /// get surah details
  /// get surah [byName, bySurahNumber(int surahNumber), byJuzNumber(int juzNumber), byVerseNumber(int verseNumber), byPageNumber(int pageNumber)]
  static _SurahDetails get surahDetails => _SurahDetails();
}

