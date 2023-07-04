import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_slider.dart';
import 'package:flutter_annulus/chain/sections/chainname_dropdown.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_annulus/shared/widgets/layout.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
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
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    return CustomLayout(
      header: Header(
        logoAsset: colorTheme == ThemeMode.light
            ? 'images/logo.svg'
            : 'images/logo_dark.svg',
        onSearch: () {},
        onDropdownChanged: (String value) {},
      ),
      mobileHeader: ChainNameDropDown(
        colorTheme: colorTheme,
      ),
      content: Container(
        decoration: BoxDecoration(
          color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20.0 : 40.0, vertical: 20),
              child: ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                columnSpacing: 40.0,
                children: [
                  const ResponsiveRowColumnItem(
                    rowFlex: 3,
                    child: ChainInfo(),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 2,
                    child: Container(
                      height: 367,
                      decoration: !isTablet
                          ? BoxDecoration(
                              color: getSelectedColor(
                                  colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: getSelectedColor(
                                      colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                                  style: BorderStyle.solid,
                                  width: 1.0),
                            )
                          : null,
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
        child: const Footer(),
      ),
    );
  }
}
