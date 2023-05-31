import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/lower_stats_without_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../../shared/utils/theme_color.dart';
import '../providers/chain_provider.dart';
import '../widgets/chain_info/top_stat_with_icon.dart';
import '../widgets/chain_info/lower_stat_with_icon.dart';

class ChainInfo extends HookConsumerWidget {
  const ChainInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Chain> chainInfo = ref.watch(chainProvider);
    final colorTheme = ref.watch(appThemeColorProvider);
    final isTabletOrMobile =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);

    return chainInfo.when(
      data: (chain) => Container(
        margin: isTabletOrMobile ? null : const EdgeInsets.only(right: 40),
        decoration: BoxDecoration(
          color: colorTheme == ColorMode.light
              ? Colors.white
              : const Color(0xFF282A2C),
          borderRadius: BorderRadius.circular(10.0),
          border: isTabletOrMobile
              ? null
              : Border.all(
                  color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                  style: BorderStyle.solid,
                  width: 1.0),
        ),
        height: isTabletOrMobile ? 600 : 408,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Top Metrics
            SizedBox(
              child: Container(
                padding: isMobile
                    ? const EdgeInsets.all(5.0)
                    : const EdgeInsets.all(42.0),
                margin: isMobile ? const EdgeInsets.only(bottom: 10.0) : null,
                child: ResponsiveRowColumn(
                  layout:
                      ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                          ? ResponsiveRowColumnType.COLUMN
                          : ResponsiveRowColumnType.ROW,
                  columnSpacing: 20.0,
                  children: [
                    ResponsiveRowColumnItem(
                      child: TopStatWithIcon(
                          iconString: 'images/speedometer.svg',
                          titleString: "Data Throughput",
                          statAmount: chain.dataThroughput.toString(),
                          statSymbol: " kbps",
                          firstItem: true),
                    ),
                    ResponsiveRowColumnItem(
                      child: isMobile
                          ? Divider(
                              color: getSelectedColor(
                                  colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                              indent: 20,
                              endIndent: 20,
                              height: 1,
                            )
                          : VerticalDivider(
                              indent: 20,
                              endIndent: 20,
                              thickness: 1,
                              color: getSelectedColor(
                                  colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                            ),
                    ),
                    ResponsiveRowColumnItem(
                      child: TopStatWithIcon(
                        iconString: 'images/wallet.svg',
                        titleString: "Unique Active Addresses",
                        statAmount: chain.uniqueActiveAddresses.toString(),
                        statSymbol: " /3,135",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
              indent: 0,
              height: 1,
            ),
            //Bottom Metrics
            SizedBox(
              child: ResponsiveRowColumn(
                layout:
                    ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 20.0 : 32.0,
                          horizontal: isMobile ? 25 : 40.0),
                      child: ResponsiveRowColumn(
                        layout: ResponsiveBreakpoints.of(context)
                                .smallerOrEqualTo(MOBILE)
                            ? ResponsiveRowColumnType.ROW
                            : ResponsiveRowColumnType.COLUMN,
                        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ResponsiveRowColumnItem(
                            child: SizedBox(
                              width: 135.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Eon",
                                    style: TextStyle(
                                      color: Color(0xFF858E8E),
                                      fontSize: 16,
                                      fontFamily: 'Rational Display Medium',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    chain.eon.toString(),
                                    style: TextStyle(
                                      color: getSelectedColor(
                                          colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Rational Display Medium',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ResponsiveRowColumnItem(
                              child: SizedBox(
                            width: 135,
                            child: Row(
                              children: [
                                isMobile
                                    ? SizedBox(
                                        height: 40,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          color: getSelectedColor(colorTheme,
                                              0xFFE7E8E8, 0xFF4B4B4B),
                                        ),
                                      )
                                    : const SizedBox(),
                                isMobile
                                    ? const SizedBox(
                                        width: 10,
                                      )
                                    : const SizedBox(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Era",
                                      style: TextStyle(
                                        color: Color(0xFF858E8E),
                                        fontSize: 16,
                                        fontFamily: 'Rational Display Medium',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      chain.era.toString(),
                                      style: TextStyle(
                                        color: getSelectedColor(
                                            colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Rational Display Medium',
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowColumn: true,
                    child: isMobile
                        ? Divider(
                            color: getSelectedColor(
                                colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                            indent: 0,
                            height: 1,
                            endIndent: 0,
                          )
                        : VerticalDivider(
                            indent: 0,
                            color: getSelectedColor(
                                colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                            width: 1),
                  ),
                  ResponsiveRowColumnItem(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: isMobile ? 10.0 : 32.0,
                              horizontal: isMobile ? 0 : 40.0),
                          child: Wrap(
                            spacing: 10.0,
                            runSpacing: 20.0,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              LowerStatWithoutIcon(
                                statValue: chain.epoch.toString(),
                                statSymbol: "Epoch",
                                firstItem: true,
                              ),
                              LowerStatWithoutIcon(
                                statValue:
                                    chain.totalTransactionsInEpoch.toString(),
                                statSymbol: "Txs",
                              ),
                              LowerStatWithoutIcon(
                                statValue: chain.height.toString(),
                                statSymbol: "Height",
                                firstItem: isMobile,
                              ),
                              LowerStatWithoutIcon(
                                statValue: chain.averageBlockTime.toString(),
                                statSymbol: "Avg Block Time",
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: getSelectedColor(
                              colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                          indent: 0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: isMobile ? 20.0 : 32.0,
                              horizontal: isMobile ? 0 : 40.0),
                          child: Wrap(
                            spacing: 10.0,
                            runSpacing: 20.0,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              LowerStatWithIcon(
                                icon: Icons.info_outline,
                                statString: '${chain.totalStake.toString()}%',
                                statSymbol: "Total Stake",
                                firstItem: true,
                              ),
                              LowerStatWithIcon(
                                  icon: Icons.info_outline,
                                  statString: chain.registeredStakes.toString(),
                                  statSymbol: "Registered Stakes"),
                              LowerStatWithIcon(
                                icon: Icons.info_outline,
                                statString: '${chain.activeStakes.toString()}%',
                                statSymbol: "Active Stakes",
                                firstItem: isMobile,
                              ),
                              LowerStatWithIcon(
                                  icon: Icons.info_outline,
                                  statString:
                                      '${chain.inactiveStakes.toString()}%',
                                  statSymbol: "Inactive Stakes"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
