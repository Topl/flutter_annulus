import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/custom_tooltip.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../../shared/utils/theme_color.dart';
import '../providers/chain_statistics_provider.dart';
import '../widgets/chain_info/top_stat_with_icon.dart';
import '../widgets/chain_info/stat_info_card.dart';

class ChainInfo extends HookConsumerWidget {
  const ChainInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Chain> chainInfo = ref.watch(chainStatisticsProvider);
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return chainInfo.when(
      data: (chain) => Container(
        margin: isMobile ? null : EdgeInsets.only(right: isTablet ? 5 : 40),
        decoration: BoxDecoration(
          color: colorTheme == ThemeMode.light ? Colors.white : const Color(0xFF282A2C),
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
            SizedBox(
              child: Container(
                padding: isMobile ? const EdgeInsets.all(5.0) : const EdgeInsets.all(20.0),
                margin: isMobile ? const EdgeInsets.only(bottom: 10.0) : null,
                child: ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  columnSpacing: 20.0,
                  // rowSpacing: 60.0,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: TopStatWithIcon(
                          iconString: 'assets/icons/speedometer.svg',
                          titleString: "Data Throughput",
                          statAmount: chain.dataThroughput.toString(),
                          statSymbol: " kbps",
                          firstItem: true),
                    ),
                    ResponsiveRowColumnItem(
                      child: isMobile
                          ? Divider(
                              color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                              indent: 20,
                              endIndent: 20,
                              height: 1,
                            )
                          : VerticalDivider(
                              indent: 20,
                              endIndent: 20,
                              thickness: 1,
                              color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                            ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: TopStatWithIcon(
                        iconString: 'assets/icons/coin.svg',
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
                layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: isMobile ? 20.0 : 32.0, horizontal: isMobile ? 25 : 20.0),
                      child: ResponsiveRowColumn(
                        layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                            ? ResponsiveRowColumnType.ROW
                            : ResponsiveRowColumnType.COLUMN,
                        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                        columnCrossAxisAlignment: CrossAxisAlignment.start,
                        columnSpacing: 30.0,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Column(
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
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const CustomTooltip(
                                    tooltipText: Strings.eonTooltipText,
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Color(0xFF858E8E),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: Row(
                              children: [
                                isMobile
                                    ? SizedBox(
                                        height: 40,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                const CustomTooltip(
                                  tooltipText: Strings.eraTooltipText,
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Color(0xFF858E8E),
                                  ),
                                ),
                              ],
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
                            color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
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
                                color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                                width: 1),
                          ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 6,
                    child: Column(
                      crossAxisAlignment: !isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: isMobile ? 20.0 : 32.0, horizontal: isMobile ? 20 : 20.0),
                          child: ResponsiveRowColumn(
                            layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            columnSpacing: 10.0,
                            children: [
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: StatInfoCard(
                                  statString: chain.epoch.toString(),
                                  statSymbol: "Epoch",
                                  firstItem: true,
                                  tooltipText: Strings.epochTooltipText,
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: StatInfoCard(
                                    statString: chain.totalTransactionsInEpoch.toString(),
                                    statSymbol: "Txs",
                                    firstItem: isMobile,
                                    tooltipText: Strings.totalTransactionTooltipText),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: StatInfoCard(
                                  statString: chain.height.toString(),
                                  statSymbol: "Height",
                                  firstItem: isMobile,
                                  tooltipText: Strings.heightTooltipText,
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: StatInfoCard(
                                  statString: chain.averageBlockTime.toString(),
                                  statSymbol: "Avg Block Time",
                                  firstItem: isMobile,
                                  tooltipText: Strings.averageBlockTimeTooltipText,
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
                            color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                            indent: 0,
                            endIndent: 0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: isMobile ? 20.0 : 32.0, horizontal: isMobile ? 20.0 : 20.0),
                          child: ResponsiveRowColumn(
                            layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            columnSpacing: 10.0,
                            children: [
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: StatInfoCard(
                                  statString: '${chain.totalStake.toString()}%',
                                  statSymbol: "Total Stake",
                                  firstItem: true,
                                  tooltipText: Strings.totalStakeTooltipText,
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: StatInfoCard(
                                  statString: chain.registeredStakes.toString(),
                                  statSymbol: "Registered\nStakes",
                                  firstItem: isMobile,
                                  tooltipText: Strings.registeredStakesTooltipText,
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: StatInfoCard(
                                  statString: '${chain.activeStakes.toString()}%',
                                  statSymbol: "Active\nStakes",
                                  firstItem: isMobile,
                                  tooltipText: Strings.activeStakesTooltipText,
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: StatInfoCard(
                                  statString: '${chain.inactiveStakes.toString()}%',
                                  statSymbol: "Inactive\nStakes",
                                  firstItem: isMobile,
                                  tooltipText: Strings.invalidStakesTooltipText,
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
      error: (error, stack) => const Text('Oops, something unexpected happened'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
