import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

ThemeData lightTheme({
  required BuildContext context,
}) {
  final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
  final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
  final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

  const Color textColor = Color(0xFF282A2C);
  const Color textColor2 = Color(0xFF000000);
  const Color altTextColor = Color(0xFF858E8E);
  const Color altTextColor2 = Color(0xFF535757);
  const Color backgroundColor = Color(0xFFFEFEFE);

  return ThemeData().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    textTheme: _textTheme(
      isMobile: isMobile,
      textColor: textColor,
      textColor2: textColor2,
      altTextColor: altTextColor,
      altTextColor2: altTextColor2,
    ),
  );
}

ThemeData darkTheme({
  required BuildContext context,
}) {
  final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
  final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
  final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

  const Color textColor = Color(0xFFFEFEFE);
  const Color textColor2 = Color(0xFFF5F5F5);
  const Color altTextColor = Color(0xFFC0C4C4);
  const Color altTextColor2 = Color(0xFFC0C4C4);
  const Color backgroundColor = Color(0xFF282A2C);

  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    textTheme: _textTheme(
      isMobile: isMobile,
      textColor: textColor,
      textColor2: textColor2,
      altTextColor: altTextColor,
      altTextColor2: altTextColor2,
    ),
  );
}

TextTheme _textTheme({
  required bool isMobile,
  required Color textColor,
  required Color textColor2,
  required Color altTextColor,
  required Color altTextColor2,
}) {
  return ThemeData().textTheme.copyWith(
        /// Headline
        headlineLarge: TextStyle(
          fontSize: isMobile ? 18 : 30,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontFamily: "Rational Display",
        ),

        /// Title
        titleLarge: TextStyle(
          color: textColor2,
          fontWeight: FontWeight.w600,
          fontSize: 24,
          fontFamily: "Rational Display",
        ),
        titleMedium: TextStyle(
          color: altTextColor,
          fontSize: 16,
          fontFamily: "Rational Display",
        ),
        titleSmall: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rational Display Medium',
          fontStyle: FontStyle.normal,
        ),

        /// Label
        labelLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: altTextColor,
          fontFamily: "Rational Display",
        ),

        /// Body
        bodyMedium: TextStyle(
          fontSize: 16.0,
          color: altTextColor2,
          fontWeight: FontWeight.w300,
          fontFamily: "Rational Display",
        ),
        bodySmall: TextStyle(
          color: altTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          fontFamily: 'Rational Display Light',
          fontStyle: FontStyle.normal,
        ),
      );
}

TextStyle? headlineLarge(BuildContext context) {
  return Theme.of(context).textTheme.headlineLarge;
}

TextStyle? titleLarge(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge;
}

TextStyle? titleMedium(BuildContext context) {
  return Theme.of(context).textTheme.titleMedium;
}

TextStyle? titleSmall(BuildContext context) {
  return Theme.of(context).textTheme.titleSmall;
}

TextStyle? labelLarge(BuildContext context) {
  return Theme.of(context).textTheme.labelLarge;
}

TextStyle? bodyMedium(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium;
}

TextStyle? bodySmall(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall;
}
