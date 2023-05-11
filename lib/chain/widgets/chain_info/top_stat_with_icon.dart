import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/providers/app_theme_provider.dart';

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
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: firstItem ? 0 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconString,
              width: 20.0,
              height: 16.0,
            ),
            Container(
                margin: const EdgeInsets.only(top: 14),
                child: Text(
                  titleString,
                  style: TextStyle(
                    color: colorTheme == ColorMode.light
                        ? const Color(0xFF858E8E)
                        : const Color(0xFFC0C4C4),
                    fontSize: 16,
                    fontFamily: 'Rational Display',
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Text(statAmount,
                      style: TextStyle(
                        color: colorTheme == ColorMode.light
                            ? const Color(0xFF000000)
                            : const Color(0xFFF5F5F5),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rational Display',
                        fontSize: 24,
                      )),
                  Text(statSymbol,
                      style: TextStyle(
                        color: colorTheme == ColorMode.light
                            ? const Color(0xFF535757)
                            : const Color(0xFFC0C4C4),
                        fontSize: 16,
                        fontFamily: 'Rational Display',
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
