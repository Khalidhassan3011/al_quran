part of '../../al_quran.dart';

class _SurahDetails {
  /// get every surah details by surah name
  /// its return a object of Surah type
  /* Example
      format: AlQuran.surahDetails.byName.[surah name]

      AlQuran.surahDetails.byName.alFatiha
      --> it will return instance of Surah fatiha
   */
  _SurahDetailsByName get byName => _SurahDetailsByName();


  /// get every surah details by surah name
  /// its return a object of Surah type
  /* Example
      format: AlQuran.surahDetails.bySurahNumber(surah number)

      AlQuran.surahDetails.bySurahNumber(1)
      --> it will return instance of Surah fatiha
   */

  /* NB
      [surahNumber] must be valid otherwise function throw an error
   */
  Surah bySurahNumber(int surahNumber) => Utils.surahValidation(surahNumber)
      ? Surah.fromJson(FullQuranData.full[surahNumber - 1])
      : throw AppStrings.invalidSurahNumber;

  /// get surah details by juz/para number
  /// its return a list of Surah object
  /// one juz  will be contains multiple surah [ex: juz number 30]
  /* Example
      format: AlQuran.surahDetails.byJuzNumber(juz number)

      AlQuran.surahDetails.byJuzNumber(1)
      --> it will return instance [List<Surah>]
   */

  /* NB
      [juzNumber] must be valid otherwise function throw an error
   */
  List<Surah> byJuzNumber(int juzNumber) {
    // throw error for invalid juzNumber
    if(Utils.juzValidation(juzNumber)) throw AppStrings.invalidJuzNumber;

    List<Surah> temp = [];

    for(int surahNumber in JuzData.juz[juzNumber - 1]["surahs"].length) {
      temp.add(bySurahNumber(surahNumber));
    }

    return temp;
  }

  /// get surah details by verse/ayat number
  /// its return a Surah object
  /* Example
      format: AlQuran.surahDetails.byVerseNumber(verse number)

      AlQuran.surahDetails.byVerseNumber(1)
      --> it will return instance of Surah
   */

  /* NB
      [verseNumber] must be valid otherwise function throw an error
   */
  Surah byVerseNumber(int verseNumber) {
    // throw error for invalid verseNumber
    if(Utils.verseValidation(verseNumber)) throw AppStrings.invalidVerseNumber;

    int totalVerseSearch = 0;
    for (int surahNumber = 0; surahNumber < FullQuranData.full.length; surahNumber++) {
      Surah surah = Surah.fromJson(FullQuranData.full[surahNumber]);

      totalVerseSearch += surah.verse;

      if (totalVerseSearch >= verseNumber) {
        return surah;
      }
    }

    throw AppStrings.somethingWrong;
  }

  /// get surah details by page number
  /// its return a list of Surah object
  /// one page will be contains multiple surah [ex: juz number 30]
  /* Example
      format: AlQuran.surahDetails.byPageNumber(page number)

      AlQuran.surahDetails.byPageNumber(1)
      --> it will return instance [List<Surah>]
   */

  /* NB
      [pageNumber] must be valid otherwise function throw an error
   */
  List<Surah> byPageNumber(int pageNumber) {
    // throw error for invalid pageNumber
    if(Utils.verseValidation(pageNumber)) throw AppStrings.invalidPageNumber;

    List<Surah> temp = [];

    for (var element in PageData.page[pageNumber - 1]) {
      temp.add(bySurahNumber(element["surah"]!));
    }

    return temp;
  }

}

class _SurahDetailsByName {

  // surah alFatiha
  Surah get alFatiha => AllSurahs.alFatiha.details;

  // surah alBaqarah
  Surah get alBaqarah => AllSurahs.alBaqarah.details;

  // surah alImran
  Surah get alImran => AllSurahs.alImran.details;

  // surah anNisa
  Surah get anNisa => AllSurahs.anNisa.details;

  // surah alMaidah
  Surah get alMaidah => AllSurahs.alMaidah.details;

  // surah alAnam
  Surah get alAnam => AllSurahs.alAnam.details;

  // surah alAraf
  Surah get alAraf => AllSurahs.alAraf.details;

  // surah alAnfal
  Surah get alAnfal => AllSurahs.alAnfal.details;

  // surah atTawbah
  Surah get atTawbah => AllSurahs.atTawbah.details;

  // surah alYunus
  Surah get alYunus => AllSurahs.alYunus.details;

  // surah hud
  Surah get hud => AllSurahs.hud.details;

  // surah yusuf
  Surah get yusuf => AllSurahs.yusuf.details;

  // surah arRad
  Surah get arRad => AllSurahs.arRad.details;

  // surah ibrahim
  Surah get ibrahim => AllSurahs.ibrahim.details;

  // surah alHijr
  Surah get alHijr => AllSurahs.alHijr.details;

  // surah anNahl
  Surah get anNahl => AllSurahs.anNahl.details;

  // surah alIsra
  Surah get alIsra => AllSurahs.alIsra.details;

  // surah alKahf
  Surah get alKahf => AllSurahs.alKahf.details;

  // surah maryam
  Surah get maryam => AllSurahs.maryam.details;

  // surah taHa
  Surah get taHa => AllSurahs.taHa.details;

  // surah alAnbiya
  Surah get alAnbiya => AllSurahs.alAnbiya.details;

  // surah alHajj
  Surah get alHajj => AllSurahs.alHajj.details;

  // surah alMuminun
  Surah get alMuminun => AllSurahs.alMuminun.details;

  // surah anNur
  Surah get anNur => AllSurahs.anNur.details;

  // surah alFurqan
  Surah get alFurqan => AllSurahs.alFurqan.details;

  // surah asSuara
  Surah get asSuara => AllSurahs.asSuara.details;

  // surah anNaml
  Surah get anNaml => AllSurahs.anNaml.details;

  // surah alQasas
  Surah get alQasas => AllSurahs.alQasas.details;

  // surah alAnkabut
  Surah get alAnkabut => AllSurahs.alAnkabut.details;

  // surah arRum
  Surah get arRum => AllSurahs.arRum.details;

  // surah luqman
  Surah get luqman => AllSurahs.luqman.details;

  // surah asSajdah
  Surah get asSajdah => AllSurahs.asSajdah.details;

  // surah alAhzab
  Surah get alAhzab => AllSurahs.alAhzab.details;

  // surah saba
  Surah get saba => AllSurahs.saba.details;

  // surah fatir
  Surah get fatir => AllSurahs.fatir.details;

  // surah yasin
  Surah get yasin => AllSurahs.yasin.details;

  // surah asSaffat
  Surah get asSaffat => AllSurahs.asSaffat.details;

  // surah saad
  Surah get saad => AllSurahs.saad.details;

  // surah azZumar
  Surah get azZumar => AllSurahs.azZumar.details;

  // surah ghafir
  Surah get ghafir => AllSurahs.ghafir.details;

  // surah fussilat
  Surah get fussilat => AllSurahs.fussilat.details;

  // surah asSura
  Surah get asSura => AllSurahs.asSura.details;

  // surah azZukhruf
  Surah get azZukhruf => AllSurahs.azZukhruf.details;

  // surah adDukhan
  Surah get adDukhan => AllSurahs.adDukhan.details;

  // surah alJaathiyah
  Surah get alJaathiyah => AllSurahs.alJaathiyah.details;

  // surah alAhqaf
  Surah get alAhqaf => AllSurahs.alAhqaf.details;

  // surah muhammad
  Surah get muhammad => AllSurahs.muhammad.details;

  // surah alFath
  Surah get alFath => AllSurahs.alFath.details;

  // surah alHujurut
  Surah get alHujurut => AllSurahs.alHujurut.details;

  // surah qaaf
  Surah get qaaf => AllSurahs.qaaf.details;

  // surah adDariyat
  Surah get adDariyat => AllSurahs.adDariyat.details;

  // surah atToor
  Surah get atToor => AllSurahs.atToor.details;

  // surah anNajm
  Surah get anNajm => AllSurahs.anNajm.details;

  // surah alQamar
  Surah get alQamar => AllSurahs.alQamar.details;

  // surah arRahman
  Surah get arRahman => AllSurahs.arRahman.details;

  // surah alWaqiah
  Surah get alWaqiah => AllSurahs.alWaqiah.details;

  // surah alHadeed
  Surah get alHadeed => AllSurahs.alHadeed.details;

  // surah alMujadila
  Surah get alMujadila => AllSurahs.alMujadila.details;

  // surah alHashr
  Surah get alHashr => AllSurahs.alHashr.details;

  // surah alMumtahanah
  Surah get alMumtahanah => AllSurahs.alMumtahanah.details;

  // surah asSaff
  Surah get asSaff => AllSurahs.asSaff.details;

  // surah alJumuah
  Surah get alJumuah => AllSurahs.alJumuah.details;

  // surah alMunafiqoon
  Surah get alMunafiqoon => AllSurahs.alMunafiqoon.details;

  // surah atTaghabun
  Surah get atTaghabun => AllSurahs.atTaghabun.details;

  // surah atTalaq
  Surah get atTalaq => AllSurahs.atTalaq.details;

  // surah atTahreem
  Surah get atTahreem => AllSurahs.atTahreem.details;

  // surah alMulk
  Surah get alMulk => AllSurahs.alMulk.details;

  // surah alQalam
  Surah get alQalam => AllSurahs.alQalam.details;

  // surah alHaaqqah
  Surah get alHaaqqah => AllSurahs.alHaaqqah.details;

  // surah alMaarij
  Surah get alMaarij => AllSurahs.alMaarij.details;

  // surah nooh
  Surah get nooh => AllSurahs.nooh.details;

  // surah alJinn
  Surah get alJinn => AllSurahs.alJinn.details;

  // surah alMuzammil
  Surah get alMuzammil => AllSurahs.alMuzammil.details;

  // surah alMuddathir
  Surah get alMuddathir => AllSurahs.alMuddathir.details;

  // surah alQiyamah
  Surah get alQiyamah => AllSurahs.alQiyamah.details;

  // surah alInsaan
  Surah get alInsaan => AllSurahs.alInsaan.details;

  // surah alMursalat
  Surah get alMursalat => AllSurahs.alMursalat.details;

  // surah anNaba
  Surah get anNaba => AllSurahs.anNaba.details;

  // surah anNaaziat
  Surah get anNaaziat => AllSurahs.anNaaziat.details;

  // surah abasa
  Surah get abasa => AllSurahs.abasa.details;

  // surah atTakweer
  Surah get atTakweer => AllSurahs.atTakweer.details;

  // surah alInfitar
  Surah get alInfitar => AllSurahs.alInfitar.details;

  // surah alMutaffifin
  Surah get alMutaffifin => AllSurahs.alMutaffifin.details;

  // surah alInshiqaaq
  Surah get alInshiqaaq => AllSurahs.alInshiqaaq.details;

  // surah alBurooj
  Surah get alBurooj => AllSurahs.alBurooj.details;

  // surah atTaariq
  Surah get atTaariq => AllSurahs.atTaariq.details;

  // surah alAlaa
  Surah get alAlaa => AllSurahs.alAlaa.details;

  // surah alGhaashiyah
  Surah get alGhaashiyah => AllSurahs.alGhaashiyah.details;

  // surah alFajr
  Surah get alFajr => AllSurahs.alFajr.details;

  // surah alBalad
  Surah get alBalad => AllSurahs.alBalad.details;

  // surah ashShams
  Surah get ashShams => AllSurahs.ashShams.details;

  // surah alLayl
  Surah get alLayl => AllSurahs.alLayl.details;

  // surah adDhuha
  Surah get adDhuha => AllSurahs.adDhuha.details;

  // surah ashSharh
  Surah get ashSharh => AllSurahs.ashSharh.details;

  // surah atTeen
  Surah get atTeen => AllSurahs.atTeen.details;

  // surah alAlaq
  Surah get alAlaq => AllSurahs.alAlaq.details;

  // surah alQadr
  Surah get alQadr => AllSurahs.alQadr.details;

  // surah alBayyinah
  Surah get alBayyinah => AllSurahs.alBayyinah.details;

  // surah azZalzalah
  Surah get azZalzalah => AllSurahs.azZalzalah.details;

  // surah alAadiyaat
  Surah get alAadiyaat => AllSurahs.alAadiyaat.details;

  // surah alQaariah
  Surah get alQaariah => AllSurahs.alQaariah.details;

  // surah atTakaathur
  Surah get atTakaathur => AllSurahs.atTakaathur.details;

  // surah alAsr
  Surah get alAsr => AllSurahs.alAsr.details;

  // surah alHumazah
  Surah get alHumazah => AllSurahs.alHumazah.details;

  // surah alFeel
  Surah get alFeel => AllSurahs.alFeel.details;

  // surah quraysh
  Surah get quraysh => AllSurahs.quraysh.details;

  // surah alMaaoon
  Surah get alMaaoon => AllSurahs.alMaaoon.details;

  // surah alKawthar
  Surah get alKawthar => AllSurahs.alKawthar.details;

  // surah alKaafiroon
  Surah get alKaafiroon => AllSurahs.alKaafiroon.details;

  // surah anNasr
  Surah get anNasr => AllSurahs.anNasr.details;

  // surah alMasad
  Surah get alMasad => AllSurahs.alMasad.details;

  // surah alIkhlaas
  Surah get alIkhlaas => AllSurahs.alIkhlaas.details;

  // surah alFalaq
  Surah get alFalaq => AllSurahs.alFalaq.details;

  // surah anNaas
  Surah get anNaas => AllSurahs.anNaas.details;
}
