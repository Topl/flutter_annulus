import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/utils/theme_color.dart';

class LowerStatWithoutIcon extends ConsumerWidget {
  final String statValue;
  final String statSymbol;
  final bool firstItem;

  const LowerStatWithoutIcon({super.key, required this.statValue, required this.statSymbol, this.firstItem = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return SizedBox(
      child: Row(
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
          Container(
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
                  style: bodySmall(context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
