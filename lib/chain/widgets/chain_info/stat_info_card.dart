import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/custom_tooltip.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../shared/utils/theme_color.dart';

class StatInfoCard extends ConsumerWidget {
  final String statString;
  final String statSymbol;
  final bool firstItem;
  final String tooltipText;

  const StatInfoCard({
    super.key,
    required this.statString,
    required this.statSymbol,
    this.firstItem = false,
    this.tooltipText = "",
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

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
              style: bodySmall(context),
            ),
          ],
        ),
        if (isTablet) const SizedBox(width: 20),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: CustomTooltip(
            tooltipText: tooltipText,
            child: const Icon(
              Icons.info_outline,
              color: Color(0xFF858E8E),
            ),
          ),
        )
      ],
    );
  }
}
