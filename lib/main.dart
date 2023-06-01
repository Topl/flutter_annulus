import 'package:flutter/material.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/constants/ui.dart';
import 'package:flutter_annulus/shared/utils/transitions.dart';
import 'package:flutter_annulus/shared/widgets/slide_left_builder.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/transaction_table.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:vrouter/vrouter.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AnnulusRouter(),
    ),
  );
}

class AnnulusRouter extends StatelessWidget {
  const AnnulusRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      initialUrl: HomeScreen.route,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child,
          breakpoints: const [
            Breakpoint(start: 0, end: mobileBreak, name: MOBILE),
            Breakpoint(start: mobileBreak + 1, end: tabletBreak, name: TABLET),
            Breakpoint(
                start: tabletBreak + 1, end: double.infinity, name: DESKTOP),
          ],
        );
      },
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
          buildTransition: (animation, _, child) =>
              slideLeftTransition(animation, child),
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
