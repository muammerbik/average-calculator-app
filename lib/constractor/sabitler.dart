import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor AnaRenk = Colors.indigo;
  static const String baslikText = 'Ortalama Hesapla';

  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: AnaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle ortalamaGosterStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: AnaRenk);

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: AnaRenk);

  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(vertical: 8, horizontal: 16);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
