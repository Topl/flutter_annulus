import 'package:flutter/material.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/utils/transitions.dart';
import 'package:flutter_annulus/shared/widgets/slide_left_builder.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_annulus/presentation/header.dart';
import 'package:flutter_annulus/presentation/layout.dart';
import 'package:flutter_annulus/presentation/transaction_table.dart';

import 'package:flutter_annulus/widgets/transactions/transactions.dart';
import 'widgets/block_slider.dart';

import 'package:flutter_annulus/providers/app_theme_provider.dart';
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
      routes: [
        VWidget(
          path: HomeScreen.route,
          widget: const HomeScreen(),
        ),
        VNester(
          path: '',
          widgetBuilder: (Widget child) => SlideLeftBuilder(child: child),
          buildTransition: (animation, _, child) => slideLeftTransition(animation, child),
          nestedRoutes: const [
            '/transactions': (context) => CustomLayout(
              header: Header(
                logoAsset: colorTheme == ColorMode.light
                    ? 'images/logo.svg'
                    : 'images/logo_dark.svg',
                onSearch: () {},
                onDropdownChanged: (String value) {},
              ),
              content: Column(
                children: [
                  TransactionTable(),
                ],
              ),
              footer: Container(
                height: 100,
                alignment: Alignment.center,
                child: const Text("footer"),
              ),
            ),
            /// TODO: Add Tansaction Details Screen
            /// TODO: Add Block Details Screen
            /// TODO: Add New Chain Screen
          ],
        ),
      ],
    );
  }
}
