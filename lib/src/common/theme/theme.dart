import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:loyalty_challenge/src/common/constants/color_const.dart';

final theme = ThemeData(
  colorSchemeSeed: ColorConst().seedColor,
  scaffoldBackgroundColor: ColorConst().backgroundColor,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);
