import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const Color orange = Color(0xFFE74724);
const Color orangeBorder = Color(0xFFD74525);

const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);
const Color red = Color(0xFFE63634);

const Color greyBackground = Color(0xFF36454E);
const Color greyForeground = Color(0xFF263138);

const Color whiteText = Color(0xFFDDDFE0);
const Color greyText = Color(0xFFBBBEC0);

const Color blackRedText = Color(0xFF1E0B06);

class TaskStatusColor {
  static const Color inWork = Color(0xFF20A652);
  static const Color textInWork = Color(0xFF58FF7D);

  static const Color emergency = Color(0xFF532E38);
  static const Color textEmergency = Color(0xFFE63634);

  static const Color pnr = Color(0xFF243C66);
  static const Color textPnr = Color(0xFF2E6DE0);

  static const Color season = Color(0xFFCB543A);
  static const Color textSeason = Color(0xFFFFA083);

  static const Color smr = Color(0xFF8937BB);
  static const Color textSmr = Color(0xFFB77EFF);
}

class EmployeeRoleColor {
  static const Color director = Color(0xFF20A652);
  static const Color textDirector = Color(0xFF58FF7D);

  static const Color manager = Color(0xFF532E38);
  static const Color textManager = Color(0xFFE63634);

  static const Color headDepartment = Color(0xFF243C66);
  static const Color textHeadDepartment = Color(0xFF2E6DE0);

  static const Color worker = Color(0xFFCB543A);
  static const Color textWorker = Color(0xFFFFA083);

  static const Color accountant = Color(0xFF8937BB);
  static const Color textAccountant = Color(0xFFB77EFF);

  static const Color hr = Color(0xFFB4278C);
  static const Color textHr = Color(0xFFB77EFF);
}

// final ThemeData theme = ThemeData.light().copyWith(
//   colorScheme: const ColorScheme(
//     brightness: Brightness.light,
//     primary: orange,
//     onPrimary: orangeBorder,
//     secondary: greyBackground,
//     onSecondary: greyForeground,
//     error: Colors.red,
//     onError: Colors.red,
//     surface: greyBackground,
//     onSurface: greyForeground,
//   ),
//   appBarTheme: AppBarTheme(
//     backgroundColor: orange,
//     foregroundColor: orange,
//     color: orange,
//   ),
// );

final ThemeData theme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: orange,
    primaryContainer: greyForeground,
    secondary: greyBackground,
    secondaryContainer: greyForeground,
    tertiary: orangeBorder,
    tertiaryContainer: orangeBorder,
    appBarColor: black,
    error: red,
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  appBarBackground: orange,
);

final ThemeData darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: orange,
    primaryContainer: greyForeground,
    secondary: greyBackground,
    secondaryContainer: greyForeground,
    tertiary: orangeBorder,
    tertiaryContainer: orangeBorder,
    appBarColor: black,
    error: red,
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  appBarBackground: orange,
);
