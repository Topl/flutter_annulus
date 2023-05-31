import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/utils/theme_color.dart';

class TopStatWithIcon extends ConsumerWidget {
  String iconString;
  String titleString;
  String statAmount;
  String statSymbol;
  bool firstItem;

  TopStatWithIcon(
      {super.key,
      required this.iconString,
      required this.titleString,
      required this.statAmount,
      required this.statSymbol,
      this.firstItem = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    return Container(
      margin: isMobile ? null : EdgeInsets.only(left: firstItem ? 0 : 20),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        rowMainAxisAlignment: MainAxisAlignment.start,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        rowSpacing: 10.0,
        children: [
          ResponsiveRowColumnItem(
            child: SvgPicture.asset(
              iconString,
              width: 20.0,
              height: 16.0,
            ),
          ),
          ResponsiveRowColumnItem(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: isMobile ? null : const EdgeInsets.only(top: 14),
                  child: Text(
                    titleString,
                    style: TextStyle(
                      color:
                          getSelectedColor(colorTheme, 0xFF858E8E, 0xFFC0C4C4),
                      fontSize: 16,
                      fontFamily: 'Rational Display',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Text(
                        statAmount,
                        style: TextStyle(
                          color: getSelectedColor(
                              colorTheme, 0xFF000000, 0xFFF5F5F5),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Rational Display',
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        statSymbol,
                        style: TextStyle(
                          color: getSelectedColor(
                              colorTheme, 0xFF535757, 0xFFC0C4C4),
                          fontSize: 16,
                          fontFamily: 'Rational Display',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
