import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler{
  static const anarenk = Colors.indigo;
  static const baslikText =   'Ortalama Hesapla';
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize:24, fontWeight: FontWeight.w900, color: anarenk 
  );
  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
    fontSize:16, fontWeight: FontWeight.w600, color: anarenk 
  );

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize:55, fontWeight: FontWeight.w800, color: anarenk 
  );

  static final dropDownPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  

}