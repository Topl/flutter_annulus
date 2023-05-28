import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_slider.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_annulus/shared/widgets/layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../chain/sections/chain_info.dart';
import '../../chain/sections/chart_section.dart';
import '../../shared/utils/theme_color.dart';
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
            color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
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
                          color: getSelectedColor(
                              colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: getSelectedColor(
                                  colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                        child: const ChartSection(),
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
          color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
          // Terminal bug originating here
          child: const Footer(),
        ),
      ),
    );
  }
}
