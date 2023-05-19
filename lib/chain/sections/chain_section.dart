import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/sections/chain_info.dart';
import 'package:flutter_annulus/chain/sections/chart_section.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ChainSection extends HookConsumerWidget {
  const ChainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);

    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      columnPadding: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
          ? const EdgeInsets.symmetric(vertical: 20)
          : const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      columnSpacing: 30,
      columnMainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ResponsiveRowColumnItem(
          rowFlex: 3,
          child: ChainInfo(),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 2,
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
            child: const ChartSection(),
          ),
        ),
      ],
    );
  }
}
