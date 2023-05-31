import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/utils/theme_color.dart';

class LowerStatWithIcon extends ConsumerWidget {
  IconData icon;
  String statString;
  String statSymbol;
  bool firstItem;

  LowerStatWithIcon({
    super.key,
    required this.icon,
    required this.statString,
    required this.statSymbol,
    this.firstItem = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        firstItem
            ? const SizedBox()
            : Container(
                margin: EdgeInsets.only(left: firstItem ? 0 : 10),
                height: 40,
                child: VerticalDivider(
                  thickness: 1,
                  color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                ),
              ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              statString,
              style: TextStyle(
                color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rational Display Medium',
              ),
            ),
            Text(
              statSymbol,
              style: const TextStyle(
                color: Color(0xFF858E8E),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rational Display',
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Icon(
            icon,
            color: const Color(0xFF858E8E),
          ),
        )
      ],
    );
  }
}
