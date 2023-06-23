import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/lower_stats_without_icon.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
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
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return chainInfo.when(
      data: (chain) => Container(
        margin: isMobile ? null : EdgeInsets.only(right: isTablet ? 5 : 40),
        decoration: BoxDecoration(
          color: colorTheme == ThemeMode.light
              ? Colors.white
              : const Color(0xFF282A2C),
          borderRadius: BorderRadius.circular(10.0),
          border: isMobile
              ? null
              : Border.all(
                  color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                  style: BorderStyle.solid,
                  width: 1.0),
        ),
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
                  // rowSpacing: 60.0,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
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
                      rowFlex: 1,
                      child: TopStatWithIcon(
                        iconString: 'images/coin.svg',
                        titleString: "Average Transaction Fees",
                        statAmount: chain.averageTransactionFee.toString(),
                        statSymbol: " LVL",
                        firstItem: isMobile,
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
                    rowFlex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 20.0 : 32.0,
                          horizontal: isMobile ? 25 : 20.0),
                      child: ResponsiveRowColumn(
                        layout: ResponsiveBreakpoints.of(context)
                                .smallerOrEqualTo(MOBILE)
                            ? ResponsiveRowColumnType.ROW
                            : ResponsiveRowColumnType.COLUMN,
                        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                        columnCrossAxisAlignment: CrossAxisAlignment.start,
                        columnSpacing: 30.0,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Eon",
                                    style: titleMedium(context),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    chain.eon.toString(),
                                    style: titleLarge(context),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: Tooltip(
                              message: Strings.eraTooltipText,
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    isMobile
                                        ? SizedBox(
                                            height: 40,
                                            child: VerticalDivider(
                                              thickness: 1,
                                              color: getSelectedColor(
                                                  colorTheme,
                                                  0xFFE7E8E8,
                                                  0xFF4B4B4B),
                                            ),
                                          )
                                        : const SizedBox(),
                                    isMobile
                                        ? const SizedBox(
                                            width: 10,
                                          )
                                        : const SizedBox(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Era",
                                          style: titleMedium(context),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          chain.era.toString(),
                                          style: titleLarge(context),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                        : SizedBox(
                            height: 230,
                            child: VerticalDivider(
                                indent: 0,
                                endIndent: 0,
                                thickness: 1,
                                color: getSelectedColor(
                                    colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                                width: 1),
                          ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 6,
                    child: Column(
                      crossAxisAlignment: !isMobile
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: isMobile ? 20.0 : 32.0,
                              horizontal: isMobile ? 20 : 20.0),
                          child: ResponsiveRowColumn(
                            layout: ResponsiveBreakpoints.of(context)
                                    .smallerOrEqualTo(MOBILE)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            columnSpacing: 10.0,
                            children: [
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Tooltip(
                                  message: Strings.epochTooltipText,
                                  child: LowerStatWithoutIcon(
                                    statValue: chain.epoch.toString(),
                                    statSymbol: "Epoch",
                                    firstItem: true,
                                  ),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Tooltip(
                                  message: Strings.totalTransactionTooltipText,
                                  child: LowerStatWithoutIcon(
                                    statValue: chain.totalTransactionsInEpoch
                                        .toString(),
                                    statSymbol: "Txs",
                                    firstItem: isMobile,
                                  ),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Tooltip(
                                  message: Strings.heightTooltipText,
                                  child: LowerStatWithoutIcon(
                                    statValue: chain.height.toString(),
                                    statSymbol: "Height",
                                    firstItem: isMobile,
                                  ),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Tooltip(
                                  message: Strings.averageBlockTimeTooltipText,
                                  child: LowerStatWithoutIcon(
                                    statValue:
                                        chain.averageBlockTime.toString(),
                                    statSymbol: "Avg Block Time",
                                    firstItem: isMobile,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 800,
                          child: Divider(
                            thickness: 1,
                            height: 1,
                            color: getSelectedColor(
                                colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                            indent: 0,
                            endIndent: 0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: isMobile ? 20.0 : 32.0,
                              horizontal: isMobile ? 20.0 : 20.0),
                          child: ResponsiveRowColumn(
                            layout: ResponsiveBreakpoints.of(context)
                                    .smallerOrEqualTo(MOBILE)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            columnSpacing: 10.0,
                            children: [
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Tooltip(
                                  message: Strings.totalStakeTooltipText,
                                  child: LowerStatWithIcon(
                                    icon: Icons.info_outline,
                                    statString:
                                        '${chain.totalStake.toString()}%',
                                    statSymbol: "Total Stake",
                                    firstItem: true,
                                  ),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Tooltip(
                                  message: Strings.registeredStakesTooltipText,
                                  child: LowerStatWithIcon(
                                    icon: Icons.info_outline,
                                    statString:
                                        chain.registeredStakes.toString(),
                                    statSymbol: "Registered\nStakes",
                                    firstItem: isMobile,
                                  ),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: Tooltip(
                                    message: Strings.activeStakesTooltipText,
                                    child: LowerStatWithIcon(
                                      icon: Icons.info_outline,
                                      statString:
                                          '${chain.activeStakes.toString()}%',
                                      statSymbol: "Active\nStakes",
                                      firstItem: isMobile,
                                    ),
                                  )),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Tooltip(
                                  message: Strings.invalidStakesTooltipText,
                                  child: LowerStatWithIcon(
                                    icon: Icons.info_outline,
                                    statString:
                                        '${chain.inactiveStakes.toString()}%',
                                    statSymbol: "Inactive\nStakes",
                                    firstItem: isMobile,
                                  ),
                                ),
                              ),
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
