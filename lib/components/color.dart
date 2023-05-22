import 'package:flutter/material.dart';

const primaryColor = Color(0xFF5D8B66);
const secondaryColor = Color(0xFF6B8B5D);
const thirdColor = Color(0xFF828B5D);
const fourthColor = Color(0xFF5D8B7D);
const darkBackgroundColor = Color(0xFF333333);
const babyColor = Color(0xFF758FC8);
const lightBackgroundColor = Color(0xFFF2F2F2);
const blueBackgroundColor = Color(0xFFEBF5FE);
const blackColor = Color(0xFF333333);
const darkBlackColor = Color(0xFF150D26);
const darkGreyColor = Color(0xFF434343);
const greyColor = Color(0xFFC4C4C4);
const halfGreyColor = Color(0xFFf4f0ec);
const medGreyColor = Color(0xFF949496);
const blueGreyColor = Color(0xFF475E82);
const whiteColor = Color(0xFFF2F2F2);
const softWhiteColor = Color(0xFFE5E5E5);
const brownWhiteColor = Color(0xFFE2C8C8);
const yellowColor = Color(0xFFF4E84F);
const orangeColor = Color(0xFFFF6600);
const goldColor = Color(0xFFAA8B4F);
const redColor = Color(0xFFDD4247);
const pinkColor = Color(0xFFFF94E7);
const softPinkColor = Color(0xFFFFC3C3);
const greenColor = Color(0xFF86E3CE);
const softGreenColor = Color(0xFF4AA22D);
const darkGreenColor = Color(0xFF4CAD73);
const tealColor = Color(0xFFDDE6A5);
const purpleColor = Color(0xFFCCA8D8);
const blueColor = Color(0xFFA8D1E7);
final transparentColor = const Color(0xFFFFFFFF).withOpacity(0.8);
final transparentBlackColor = const Color(0xFF333333).withOpacity(0.5);
const productCardColor = Color(0xFF1A1A1A);
const productCardColor2 = Color(0xFF0F1335);
const MaterialColor kBlueColor = MaterialColor(
  0xFFA8D1E7,
  <int, Color>{
    50: Color(0xFFA8D1E7),
    100: Color(0XFF328DE1),
  },
);
const MaterialColor kGreyColor = MaterialColor(
  0XFFE0E0E0,
  <int, Color>{
    50: Color(0XFFE0E0E0),
    100: Color(0XFFC4C4C4),
    200: Color(0xFF475E82),
    300: Color(0xFF434343),
    400: Color(0xFF8AA3B5),
  },
);
const MaterialColor kBlackColor = MaterialColor(
  0XFF333333,
  <int, Color>{
    50: Color(0XFF333333),
    100: Color(0XFF150D26),
    200: Color(0XFF404451),
  },
);

class MyColors {
  static Color get darkCatalogueCardColor => const Color(0xFF333333);
  static Color get lightCatalogueCardColor => const Color(0xFFF2F2F2);
  static Color get splashBackgroundColor => const Color(0xFFD1D1D6);
  static Color get inputErrorColor => const Color(0xFFFA897B);
  static Color get inputBorderColor => const Color(0xFF6C6A6A);
  static Color get darkShadowColor => const Color(0xFF000000);
  static LinearGradient get goldGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFDEB71),
          Color(0xFFF8D800),
        ],
      );
  static Color get lightShadowColor => const Color.fromARGB(255, 95, 90, 90);
  static Color get lighterShadowColor =>
      const Color(0xFF88A5BF).withOpacity(0.5);
  static Color get inactiveTabColor => const Color(0xFF8AA3B5);
  static Color get catalogueButtonColor => const Color(0xFF29335C);
  static Color get courseCardColor => const Color(0xFFEDF1F1);
  static Color get progressColor => const Color(0xFF36F1CD);
}
