import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/bottom_section/bottom_section.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/bottom_section/top_section.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/top_chain_info_section.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MainChainInfoSection extends HookConsumerWidget {
  final Chain chain;
  final bool isLoading;
  final bool isError;

  const MainChainInfoSection({
    required this.chain,
    this.isLoading = false,
    this.isError = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: isMobile ? null : EdgeInsets.only(right: isTablet ? 5 : 40),
      decoration: BoxDecoration(
        color: isError
            ? Colors.grey[300]
            : colorTheme == ThemeMode.light
                ? Colors.white
                : const Color(0xFF282A2C),
        borderRadius: BorderRadius.circular(10.0),
        border: isMobile
            ? null
            : Border.all(
                color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B), style: BorderStyle.solid, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Top Metrics
          TopChainInfoSection(
            chain: chain,
            isLoading: isLoading,
            isMobile: isMobile,
            colorTheme: colorTheme,
          ),

          Divider(
            color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
            indent: 0,
            height: 1,
          ),
          //Bottom Metrics
          TopSection(
            chain: chain,
            isLoading: isLoading,
            isMobile: isMobile,
            colorTheme: colorTheme,
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
            indent: 0,
            endIndent: 0,
          ),
          BottomSection(
            colorTheme: colorTheme,
            chain: chain,
            isLoading: isLoading,
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }
}
