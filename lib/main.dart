import 'package:flutter/material.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/constants/ui.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:flutter_annulus/shared/utils/transitions.dart';
import 'package:flutter_annulus/shared/widgets/slide_left_builder.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/transaction_table.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:vrouter/vrouter.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: ResponsiveBreakpoints.builder(
        child: const AnnulusRouter(),
        breakpoints: const [
          Breakpoint(start: 0, end: mobileBreak, name: MOBILE),
          Breakpoint(start: mobileBreak + 1, end: tabletBreak, name: TABLET),
          Breakpoint(start: tabletBreak + 1, end: double.infinity, name: DESKTOP),
        ],
      ),
    ),
  );
}

class AnnulusRouter extends HookConsumerWidget {
  const AnnulusRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      initialUrl: HomeScreen.route,
      theme: theme(
        context: context,
        colorTheme: ref.watch(appThemeColorProvider),
      ),
      // builder: (context, child) {
      //   return ResponsiveBreakpoints.builder(
      //     child: child,
      //     breakpoints: const [
      //       Breakpoint(start: 0, end: mobileBreak, name: MOBILE),
      //       Breakpoint(start: mobileBreak + 1, end: tabletBreak, name: TABLET),
      //       Breakpoint(start: tabletBreak + 1, end: double.infinity, name: DESKTOP),
      //     ],
      //   );
      // },
      routes: [
        VWidget(
          path: HomeScreen.route,
          widget: const HomeScreen(),
        ),
        VWidget(
          path: TransactionDetailsPage.route, // Transaction details screen
          widget: const TransactionDetailsPage(transactionId: ''),
        ),
        VNester(
          path: '',
          widgetBuilder: (Widget child) => SlideLeftBuilder(child: child),
          buildTransition: (animation, _, child) => slideLeftTransition(animation, child),
          nestedRoutes: [
            VWidget(
              path: TransactionTableScreen.route, // Transaction table screen
              widget: TransactionTableScreen(),
            ),

            /// TODO: Add Block Details Screen
            /// TODO: Add New Chain Screen
          ],
        ),
      ],
    );
  }
}

ThemeData theme({
  required BuildContext context,
  required ColorMode colorTheme,
}) {
  print('QQQQ theme');
  final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
  final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
  final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

  final Color blackTextColor = getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE);
  final Color black2TextColor = getSelectedColor(colorTheme, 0xFF000000, 0xFFF5F5F5);
  final Color greyTextColor = getSelectedColor(colorTheme, 0xFF858E8E, 0xFFC0C4C4);
  final Color grey2TextColor = getSelectedColor(colorTheme, 0xFF535757, 0xFFC0C4C4);

  return ThemeData(
    fontFamily: "Rational Display",
    textTheme: TextTheme(
      /// Headline
      headlineLarge: TextStyle(
        fontSize: isMobile ? 18 : 30,
        fontWeight: FontWeight.w600,
        color: blackTextColor,
      ),

      /// Title
      titleLarge: TextStyle(
        color: black2TextColor,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: greyTextColor,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: blackTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: 'Rational Display Medium',
        fontStyle: FontStyle.normal,
      ),

      /// Label
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: greyTextColor,
      ),

      /// Body
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: grey2TextColor,
        fontWeight: FontWeight.w300,
      ),
      bodySmall: TextStyle(
        color: greyTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        fontFamily: 'Rational Display Light',
        fontStyle: FontStyle.normal,
      ),
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
