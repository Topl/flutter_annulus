import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_slider.dart';
import 'package:flutter_annulus/chain/sections/chain_section.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_annulus/shared/widgets/layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../chain/sections/chain_info.dart';
import '../../shared/widgets/footer.dart';
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
          decoration: BoxDecoration(
            color: colorTheme == ColorMode.light
                ? const Color(0xFFFEFEFE)
                : const Color(0xFF282A2C),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
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
                              color: colorTheme == ColorMode.light
                                  ? const Color(0xFFE7E8E8)
                                  : const Color(0xFF4B4B4B),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                        child: Center(
                            child: Text("Chart here",
                                style: TextStyle(
                                    color: colorTheme == ColorMode.light
                                        ? const Color(0xFF000000)
                                        : const Color(0xFFFEFEFE)))),
                      ),
                    )
                  ],
                ),
              ),
              BlockViewSlider(),
              Transactions(),
            ],
          ),
        ),
        footer: Container(
          color: colorTheme == ColorMode.light
              ? const Color(0xFFFEFEFE)
              : const Color(0xFF282A2C),
          child: const Footer(),
        ),
      ),
    );
  }
}
