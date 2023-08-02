import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../../shared/theme.dart';

/// This is a custom widget that shows toggle buttons for the block details
class CustomTabBar extends HookConsumerWidget {
  const CustomTabBar({
    super.key,
    required this.colorTheme,
  });

  final ThemeMode colorTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    final colorMode = ref.watch(appThemeColorProvider);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: isTablet ? 35 : 16),
          child: TextButton(
              onPressed: () {
                context.vRouter.to('/');
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: getSelectedColor(colorTheme, 0xFF535757, 0xFFAFB6B6)),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    Strings.backText,
                    style: bodyMedium(context),
                  ),
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.only(left: isTablet ? 45.0 : 25.0, top: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Block Details',
              style: titleLarge(context),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: SizedBox(
            child: TabBar(
              unselectedLabelColor: getSelectedColor(colorTheme, 0xFF282A2C, 0xFF858E8E),
              labelColor: getSelectedColor(colorMode, 0xFF282A2C, 0xFF858E8E),
              labelStyle: labelLarge(context),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                color: getSelectedColor(colorMode, 0xFFE7E8E8, 0xFF434648),
              ),
              padding: EdgeInsets.only(right: isTablet ? 400.0 : 100.0, top: 20.0),
              tabs: [
                Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  child: const Tab(
                    child: Text(Strings.summary),
                  ),
                ),
                const SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: Tab(text: Strings.transactions),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
