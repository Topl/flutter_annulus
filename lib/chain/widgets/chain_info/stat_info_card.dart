import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/custom_tooltip.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../shared/utils/theme_color.dart';

class StatInfoCard extends ConsumerWidget {
  static Key statInfoItemKey(String name) => Key('statInfoItemKey_$name');

  final String statString;
  final String statSymbol;
  final String tooltipText;
  final bool isLoading;

  const StatInfoCard({
    super.key,
    required this.statString,
    required this.statSymbol,
    this.tooltipText = "",
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLoading ? 'Loading' : statString,
                  style: TextStyle(
                    color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rational Display Medium',
                  ),
                ),
                Text(
                  isLoading ? 'small' : statSymbol,
                  style: bodySmall(context),
                ),
              ],
            ),
          ),
          Skeleton.ignore(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: CustomTooltip(
                tooltipText: tooltipText,
                child: const Icon(
                  Icons.info_outline,
                  color: Color(0xFF858E8E),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
