import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/header.dart';
import 'package:flutter_annulus/presentation/layout.dart';
import 'package:flutter_annulus/presentation/transaction_table.dart';

import 'package:flutter_annulus/widgets/transactions/transactions.dart';
import 'widgets/block_slider.dart';

import 'package:flutter_annulus/providers/app_theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AnnulusApp()));
}

class AnnulusApp extends ConsumerWidget {
  const AnnulusApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      initialRoute: '/',
      routes: {
        '/': (context) => CustomLayout(
              header: Header(
                logoAsset: colorTheme == ColorMode.light
                    ? 'images/logo.svg'
                    : 'images/logo_dark.svg',
                onSearch: () {},
                onDropdownChanged: (String value) {},
              ),
              content: Column(
                children: const [
                  BlockViewSlider(),
                  Transactions(),
                ],
              ),
              footer: Container(
                height: 100,
                alignment: Alignment.center,
                child: const Text("footer"),
              ),
            ),
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
      },
    );
  }
}
