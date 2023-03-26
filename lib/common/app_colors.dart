import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();

  ///Common
  static const Color primary = Color(0xFFD9251D);
  static const Color secondary = Color(0xFF47CFFF);

  ///Background
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0F1B2B);
  static const Color background2B5876 = Color(0xFF2B5876);
  static const Color background4E4376 = Color(0xFF4E4376);
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background2B5876, background4E4376],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const Color white75 = Color(0xBFFFFFFF);

  ///Shadow
  static const Color shadow = Color(0x25606060);

  ///Border
  static const Color border = Color(0xFF606060);

  ///Divider
  static const Color divider = Color(0xFF606060);

  ///Text
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);
  static const Color textBlue = Color(0xFF0000FF);
  static const Color textDisable = Color(0xFF89a3b1);

  ///TextField
  static const Color textFieldEnabledBorder = Color(0xFF919191);
  static const Color textFieldFocusedBorder = Color(0xFFd74315);
  static const Color textFieldDisabledBorder = Color(0xFF919191);
  static const Color textFieldCursor = Color(0xFF919191);

  ///Button
  static const Color buttonBGWhite = Color(0xFFcdd0d5);
  static const Color buttonBGTint = secondary;
  static const Color buttonBorder = secondary;

  /// Tabs
  static const Color imageBG = Color(0xFF919191);


  static const Color colorsA6A1E030 = Color(0x4DA6A1E0);
  static const Color colorsA1F3FE30 = Color(0x4DA1F3FE);
  static const Color colorsF5C518 = Color(0xFFF5C518);

  static const LinearGradient gradientA6A1E0A1F3FE30 = LinearGradient(
    colors: [
      colorsA6A1E030,
      colorsA1F3FE30,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  ///BottomNavigationBar
  static const Color bottomNavigationBar6B66A630 = Color(0x4D6B66A6);
  static const Color bottomNavigationBar75D1DD30 = Color(0x4D75D1DD);
  static const Color bottomNavigationBar6B66A6100 = Color(0xFF6B66A6);
  static const Color bottomNavigationBar75D1DD100 = Color(0xFF75D1DD);

  static const LinearGradient bottomNavigationBarGradient30 = LinearGradient(
    colors: [
      bottomNavigationBar6B66A630,
      bottomNavigationBar75D1DD30,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient bottomNavigationBarGradient100 = LinearGradient(
    colors: [
      bottomNavigationBar6B66A6100,
      bottomNavigationBar75D1DD100,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
