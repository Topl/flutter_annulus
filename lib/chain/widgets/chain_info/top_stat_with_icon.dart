import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/utils/theme_color.dart';

/// TopStatWithIcon Widget that displays a stat with an icon on top of it.
class TopStatWithIcon extends ConsumerWidget {
  final String iconString;
  final String titleString;
  final String statAmount;
  final String statSymbol;
  final bool firstItem;

  const TopStatWithIcon(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          firstItem
              ? const SizedBox()
              : Container(
                  margin: EdgeInsets.only(left: firstItem ? 0 : 10, right: 10),
                  height: 60,
                  child: VerticalDivider(
                    thickness: 1,
                    color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                  ),
                ),
          ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            rowMainAxisAlignment: MainAxisAlignment.start,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
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
                          color: getSelectedColor(
                              colorTheme, 0xFF858E8E, 0xFFC0C4C4),
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
          )
        ],
      ),
    );
  }
}
