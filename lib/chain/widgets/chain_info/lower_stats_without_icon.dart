import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/utils/theme_color.dart';

class LowerStatWithoutIcon extends ConsumerWidget {
  String statValue;
  String statSymbol;
  bool firstItem;

  LowerStatWithoutIcon(
      {super.key,
      required this.statValue,
      required this.statSymbol,
      this.firstItem = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: firstItem ? 0 : 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              statValue,
              style: TextStyle(
                color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rational Display Medium',
              ),
            ),
            Text(
              statSymbol,
              style: TextStyle(
                color: getSelectedColor(colorTheme, 0xFF858E8E, 0xFFC0C4C4),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rational Display',
              ),
            )
          ],
        ),
      ),
    );
  }
}
