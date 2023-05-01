import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/sections/chain_info.dart';
import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_annulus/shared/widgets/layout.dart';
import 'blocks/sections/block_slider.dart';

import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';

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
      home: CustomLayout(
        header: Header(
          logoAsset: colorTheme == ColorMode.light ? 'images/logo.svg' : 'images/logo_dark.svg',
          onSearch: () {},
          onDropdownChanged: (String value) {},
        ),
        content: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: ChainInfo(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      child: const Text("right"),
                    ),
                  )
                ],
              ),
            ),
            const BlockViewSlider()
          ],
        ),
        footer: Container(
          height: 100,
          alignment: Alignment.center,
          child: const Text("footer"),
        ),
      ),
    );
  }
}
