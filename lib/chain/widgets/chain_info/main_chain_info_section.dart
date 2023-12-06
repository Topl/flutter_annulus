import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/stat_info_card.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/top_stat_with_icon.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MainChainInfoSection extends HookConsumerWidget {
  final Chain chain;
  final bool isLoading;
  const MainChainInfoSection({
    required this.chain,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return Container(
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
          IntrinsicHeight(
            child: Container(
              padding: isMobile ? const EdgeInsets.all(5.0) : const EdgeInsets.all(20.0),
              margin: isMobile ? const EdgeInsets.only(bottom: 10.0) : null,
              child: ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                // columnSpacing: 20.0,
                // rowSpacing: 60.0,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: TopStatWithIcon(
                      iconString: 'assets/icons/speedometer.svg',
                      titleString: "Data Throughput",
                      statAmount: chain.dataThroughput.toString(),
                      statSymbol: " kbps",
                      isLoading: isLoading,
                    ),
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
                      isLoading: isLoading,
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
                                isLoading: isLoading,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: StatInfoCard(
                                statString: chain.totalTransactionsInEpoch.toString(),
                                statSymbol: "Txs",
                                firstItem: isMobile,
                                tooltipText: Strings.totalTransactionTooltipText,
                                isLoading: isLoading,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: StatInfoCard(
                                statString: chain.height.toString(),
                                statSymbol: "Height",
                                firstItem: isMobile,
                                tooltipText: Strings.heightTooltipText,
                                isLoading: isLoading,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: StatInfoCard(
                                statString: chain.averageBlockTime.toString(),
                                statSymbol: "Avg Block Time",
                                firstItem: isMobile,
                                tooltipText: Strings.averageBlockTimeTooltipText,
                                isLoading: isLoading,
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
                        padding:
                            EdgeInsets.symmetric(vertical: isMobile ? 20.0 : 32.0, horizontal: isMobile ? 20.0 : 20.0),
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
                                isLoading: isLoading,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: StatInfoCard(
                                statString: chain.registeredStakes.toString(),
                                statSymbol: "Registered\nStakes",
                                firstItem: isMobile,
                                tooltipText: Strings.registeredStakesTooltipText,
                                isLoading: isLoading,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: StatInfoCard(
                                statString: '${chain.activeStakes.toString()}%',
                                statSymbol: "Active\nStakes",
                                firstItem: isMobile,
                                tooltipText: Strings.activeStakesTooltipText,
                                isLoading: isLoading,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: StatInfoCard(
                                statString: '${chain.inactiveStakes.toString()}%',
                                statSymbol: "Inactive\nStakes",
                                firstItem: isMobile,
                                tooltipText: Strings.invalidStakesTooltipText,
                                isLoading: isLoading,
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
    );
  }
}
