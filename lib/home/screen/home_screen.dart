import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_slider.dart';
import 'package:flutter_annulus/chain/sections/chain_info.dart';
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
          logoAsset: colorTheme == ColorMode.light
              ? 'images/logo.svg'
              : 'images/logo_dark.svg',
          onSearch: () {},
          onDropdownChanged: (String value) {},
        ),
        content: Container(
          decoration: colorTheme == ColorMode.light
              ? const BoxDecoration(
                  color: Color(0xFFFEFEFE),
                )
              : const BoxDecoration(
                  color: Color(0xFF282A2C),
                ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: ChainInfo(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 408,
                        decoration: BoxDecoration(
                          color: colorTheme == ColorMode.light
                              ? const Color(0xFFFEFEFE)
                              : const Color(0xFF282A2C),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0xFFE7E8E8),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                        child: Center(child: const Text("Chart here")),
                      ),
                    )
                  ],
                ),
              ),
              const BlockViewSlider(),
              const Transactions(),
            ],
          ),
        ),
        footer: Container(
          color: colorTheme == ColorMode.light
              ? const Color(0xFFFEFEFE)
              : const Color(0xFF282A2C),
          height: 100,
          alignment: Alignment.center,
          child: const Text("footer"),
        ),
      ),
    );
  }
}
