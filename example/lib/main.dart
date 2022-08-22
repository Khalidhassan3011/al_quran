import 'package:al_quran/al_quran.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quran App Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuranApp(),
    );
  }
}

class QuranApp extends StatefulWidget {
  const QuranApp({Key? key}) : super(key: key);

  @override
  State<QuranApp> createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quran App Demo"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              _heading("Bismillah"),

              // getBismillah
              _text("Bismillah in Arabic:", AlQuran.getBismillah.ar),
              _text("Bismillah in Unicode:", AlQuran.getBismillah.unicode),
              _text("Bismillah in Bangla:", AlQuran.getBismillah.bn),

              // heading
              _heading("Quran details - count"),

              Text("Total Surah: ${AlQuran.quranDetails.count.surah}"),
              Text("Total Para / Juz: ${AlQuran.quranDetails.count.para}"),
              Text("Total Makki Surahs: ${AlQuran.quranDetails.count.makkiSurah}"),
              Text("Total Madani Surahs: ${AlQuran.quranDetails.count.madaniSurah}"),
              Text("Total Verse of Sajdah: ${AlQuran.quranDetails.count.verseOfSajdah}"),
              Text("Total Ayat / Verse: ${AlQuran.quranDetails.count.ayat}"),
              Text("Total Page: ${AlQuran.quranDetails.count.page}"),
              Text("Total Words: ${AlQuran.quranDetails.count.words}"),

              // heading
              _heading("Quran details - Full Quran"),

              // quranDetails.getFullQuran
              Text("Total surah of Quran: ${AlQuran.quranDetails.getFullQuran.length}"),

              // heading
              _heading("Quran details - Full Juz"),

              // quranDetails.getFullJuz
              Text("Total juz, by surah: ${AlQuran.quranDetails.getFullJuz.bySurah.length}"),
              Text("Total juz, by verse: ${AlQuran.quranDetails.getFullJuz.byVerse.length}"),

              // heading
              _heading("Quran details - All Ruku"),

              // quranDetails.getAllVerseByRuku
              Text("Total ruku: ${AlQuran.quranDetails.getAllVerseByRuku.length}"),

              // heading
              _heading("Quran details - Sajdah"),

              // quranDetails.getAllSajdahVerse
              Text("Total verse of sajdah, by surah: ${AlQuran.quranDetails.getAllSajdahVerse.bySurah.length}"),
              Text("Total verse of sajdah, by verse: ${AlQuran.quranDetails.getAllSajdahVerse.byVerse.length}"),

              // heading
              _heading("Surah details"),

              Text("Surah Fatiha revelation, by surah name: ${AlQuran.surahDetails.byName.alFatiha.revelationType.name}"),
              Text("Surah Fatiha revelation, by surah number: ${AlQuran.surahDetails.bySurahNumber(1).revelationType.name}"),

              // heading
              _heading("Digit conversion"),

              Text("1 to ১  ->  {1.bn}: ${1.bn}"),
              Text("1 to ١  ->  {1.ar}: ${1.ar}"),

              Text("1 to ১২৩  ->  {123.bn}: ${123.bn}"),
              Text("1 to ١٢٣  ->  {123.ar}: ${123.ar}"),

            ],
          ),
        ),
      ),
    );
  }

  Widget _heading(String title) =>
      Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: 30),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );

  Widget _text(String? textEn, String textAr) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Text(textEn ?? ""),
            const SizedBox(width: 5),
            Text(textAr, style: GoogleFonts.amiri()),
          ],
        ),
      );
}
