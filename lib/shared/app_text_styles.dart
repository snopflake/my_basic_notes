import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {

  // Silent Notes:
  /* 
    Karena pada custom text style ini aku ingin mengimplementasi .sp dari screen util pada deklarasinya,
    Aku membuat tiap variabel menjadi get method, karena jika mengimplementasi pakai
    
    static 'const' namaVariabel = TextStyle()

    si screenutil itu tidak bisa pakai constant, jadi dia butuh pakai 'final'
    tapi, bakal muncul masalah baru
    ketika kita pakai final, mungkin ketika debug itu gpp gusy
    tapii, ketika kira lepas mode debug (mode release)
    screenutilnya tuh bkal error gusy
    dan UI nya ga muncul omegat
    Jadi kaya silent error gituu

    Sekian, cmiiw
  */

  // Font Family
  static const _fontFamily = 'Inter';
  
  // H1 (30)
  static TextStyle get h1Bold => TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
  );

  static TextStyle get h1SemiBold => TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily
  );

  static TextStyle get h1Regular => TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily
  );

  // H2 (25)
    static TextStyle get h2Bold => TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamily
    );

    static TextStyle get h2Semibold => TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily
    );

    static TextStyle get h2Regular => TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily
    );

    //Medium (20)
    static TextStyle get mediumBold => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamily,
    );

    static TextStyle get mediumSemiBold => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    );

    static TextStyle get mediumRegular => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    );

    // Base (16)
    static TextStyle get baseBold => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamily,
    );

    static TextStyle get baseSemiBold => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    );

    static TextStyle get baseRegular => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    );

    // Small (12)
    static TextStyle get smallBold => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamily,
    );

    static TextStyle get smallSemiBold => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    );

    static TextStyle get smallRegular => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    );

    // XS (10)
    static TextStyle get xsBold => TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamily,
    );

    static TextStyle get xsSemiBold => TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    );

    static TextStyle get xsRegular => TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    );

}