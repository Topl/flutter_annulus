import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_slider.dart';
import 'package:flutter_annulus/chain/sections/chain_section.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_annulus/shared/widgets/layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../transactions/sections/transactions.dart';

class HomeScreen extends HookConsumerWidget {
  static const String route = '/';

  const HomeScreen({Key? key}) : super(key: key);

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
            const ChainSection(),
            BlockViewSlider(),
            Transactions(),
          ],
        ),
        footer: Container(
          color: colorTheme == ColorMode.light ? const Color(0xFFFEFEFE) : const Color(0xFF282A2C),
          height: 100,
          alignment: Alignment.center,
          child: Text("Footer",
              style:
                  TextStyle(color: colorTheme == ColorMode.light ? const Color(0xFF000000) : const Color(0xFFFEFEFE))),
        ),
      ),
    );
  }
}
