import '../data/full_quran_data.dart';
import '../enum/all_surahs.dart';
import '../model/surah.dart';

extension EngDigitToOther on int {
  // translate english digit to bangla
  String get bn => _numConversion(["০", "১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯"], this);

  // translate english digit to arabic
  String get ar => _numConversion(["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"], this);

  // translate digit one to another
  String _numConversion(List<String> numberList, int number) {
    String number = "";

    for (String digit in toString().split("")) {
      number += numberList[int.parse(digit)];
    }

    return number;
  }
}

extension AllSurahsDetails on AllSurahs {
  /// convert json to surah object based on surah name based on enum class [AllSurahs]
  Surah get details => Surah.fromJson(FullQuranData.full[AllSurahs.values.indexOf(this)]);
}
