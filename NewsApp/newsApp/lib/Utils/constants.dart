import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const kBlack = Color(0xFF1C1C1C);
  static const kGrey = Color(0xFF3C3C3C);
  static const kOrange = Color(0xFFFBB45A);

  static var kPageTitleStyle = GoogleFonts.questrial(
      color: kOrange.withOpacity(.8),
      fontSize: 28,
      fontWeight: FontWeight.w600,
      decorationThickness: 1.2,
      letterSpacing: 1.9);
  static var kTitleStyle = GoogleFonts.questrial(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static var kSubtitleStyle = GoogleFonts.questrial(
    color: Colors.white,
    fontSize: 12,
  );

  static Map<String, String> countries = {
    "Turkey": "tr",
    "Germany": "de",
    "England": "en"
  };
  static Map<String, String> tags = {
    "Economy": "ec",
    "Technology": "tc",
    "Sport": "sp",
    "General": "ge"
  };
}
