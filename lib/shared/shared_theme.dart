import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants_assets.dart';

class SharedTheme {
  static const Color whiteColor = Color(0xFFFFFFFF);

  // static final _primaryTextStyle = GoogleFonts.josefinSans().fontFamily;
  // static final _secondaryTextStyle = GoogleFonts.openSans().fontFamily;
  static const _primaryTextStyle = ConstantsAssets.primaryFontFamily;

  static const thin = FontWeight.w100;
  static const extraLight = FontWeight.w200;
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
  static const black = FontWeight.w900;

  static final _lightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF2B64AF),
  );

  static final _darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF2B64AF),
  );

  // static const _lightColorScheme = ColorScheme(
  //   brightness: Brightness.light,
  //   primary: Color(0xFF006E26),
  //   onPrimary: Color(0xFFFFFFFF),
  //   primaryContainer: Color(0xFF86FB91),
  //   onPrimaryContainer: Color(0xFF002106),
  //   secondary: Color(0xFF526350),
  //   onSecondary: Color(0xFFFFFFFF),
  //   secondaryContainer: Color(0xFFD5E8D0),
  //   onSecondaryContainer: Color(0xFF101F10),
  //   tertiary: Color(0xFF39656B),
  //   onTertiary: Color(0xFFFFFFFF),
  //   tertiaryContainer: Color(0xFFBCEBF2),
  //   onTertiaryContainer: Color(0xFF001F23),
  //   error: Color(0xFFBA1A1A),
  //   errorContainer: Color(0xFFFFDAD6),
  //   onError: Color(0xFFFFFFFF),
  //   onErrorContainer: Color(0xFF410002),
  //   surface: Color(0xFFFCFDF7),
  //   onSurface: Color(0xFF1A1C19),
  //   surfaceContainerHighest: Color(0xFFDEE5D9),
  //   onSurfaceVariant: Color(0xFF424940),
  //   outline: Color(0xFF72796F),
  //   onInverseSurface: Color(0xFFF0F1EB),
  //   inverseSurface: Color(0xFF2F312D),
  //   inversePrimary: Color(0xFF69DE77),
  //   shadow: Color(0xFF000000),
  //   surfaceTint: Color(0xFF006E26),
  //   outlineVariant: Color(0xFFC2C9BD),
  //   scrim: Color(0xFF000000),
  // );

  // static const _darkColorScheme = ColorScheme(
  //   brightness: Brightness.dark,
  //   primary: Color(0xFF69DE77),
  //   onPrimary: Color(0xFF003910),
  //   primaryContainer: Color(0xFF00531A),
  //   onPrimaryContainer: Color(0xFF86FB91),
  //   secondary: Color(0xFFB9CCB5),
  //   onSecondary: Color(0xFF243424),
  //   secondaryContainer: Color(0xFF3A4B39),
  //   onSecondaryContainer: Color(0xFFD5E8D0),
  //   tertiary: Color(0xFFA1CED5),
  //   onTertiary: Color(0xFF00363C),
  //   tertiaryContainer: Color(0xFF1F4D53),
  //   onTertiaryContainer: Color(0xFFBCEBF2),
  //   error: Color(0xFFFFB4AB),
  //   errorContainer: Color(0xFF93000A),
  //   onError: Color(0xFF690005),
  //   onErrorContainer: Color(0xFFFFDAD6),
  //   surface: Color(0xFF1A1C19),
  //   onSurface: Color(0xFFE2E3DD),
  //   surfaceContainerHighest: Color(0xFF424940),
  //   onSurfaceVariant: Color(0xFFC2C9BD),
  //   outline: Color(0xFF8C9388),
  //   onInverseSurface: Color(0xFF1A1C19),
  //   inverseSurface: Color(0xFFE2E3DD),
  //   inversePrimary: Color(0xFF006E26),
  //   shadow: Color(0xFF000000),
  //   surfaceTint: Color(0xFF69DE77),
  //   outlineVariant: Color(0xFF424940),
  //   scrim: Color(0xFF000000),
  // );

  static const lightSuccessColor = Color.fromARGB(255, 21, 91, 83);
  static const darkSuccessColor = Color(0xFF249689);
  static const lightInfoColor = Color(0xFF1307B2);
  static const darkInfoColor = Color.fromARGB(255, 62, 49, 232);
  static const errorColor = Color(0xFFFF5963);
  static const warningColors = Color(0xFFF9CF58);
  static const darkWarningColor = Color.fromARGB(255, 255, 136, 10);
  static const lightWarningColor = Color(0xFFE57B09);

  static final successColor =
      Get.isDarkMode ? darkSuccessColor : lightSuccessColor;
  static final warningColor =
      Get.isDarkMode ? darkWarningColor : lightWarningColor;
  static final infoColor = Get.isDarkMode ? darkInfoColor : lightInfoColor;

  // static final _textThemeStyle = TextTheme(
  //   bodyLarge: TextStyle(fontFamily: _secondaryTextStyle),
  //   bodyMedium: TextStyle(fontFamily: _secondaryTextStyle),
  //   bodySmall: TextStyle(fontFamily: _secondaryTextStyle),
  // );

  static final lightThemeMaterial = ThemeData(
    colorScheme: _lightColorScheme,
    fontFamily: _primaryTextStyle,
    // textTheme: _textThemeStyle,
  );

  static final darkThemeMaterial = ThemeData(
    colorScheme: _darkColorScheme,
    fontFamily: _primaryTextStyle,
    // textTheme: _textThemeStyle,
  );

  static final lightThemeCupertino = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: _lightColorScheme.primary,
    scaffoldBackgroundColor: _lightColorScheme.onSurface,
    applyThemeToAll: true,
  );

  static final darkThemeCupertino = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkColorScheme.primary,
    scaffoldBackgroundColor: _darkColorScheme.surface,
    applyThemeToAll: true,
  );
}
