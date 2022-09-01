import 'package:al_quran/al_quran.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// test constant value (count)
  test("Test constant value", () {
    // number of surah
    expect(114, AlQuran.quranDetails.count.surah);

    // number of surah for all surah
    expect(114, AlQuran.quranDetails.getFullQuran.length);
  });
}
