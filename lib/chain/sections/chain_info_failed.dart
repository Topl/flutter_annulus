import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';

import '../../shared/constants/strings.dart';
import '../../shared/theme.dart';
import '../../shared/utils/theme_color.dart';
import '../widgets/chain_info/custom_tooltip.dart';
import '../widgets/chain_info/stat_info_card.dart';
import '../widgets/chain_info/top_stat_with_icon.dart';

class ChainInfoFailed extends StatelessWidget {
  const ChainInfoFailed({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.colorTheme,
  });

  final bool isMobile;
  final bool isTablet;
  final ThemeMode colorTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMobile ? null : EdgeInsets.only(right: isTablet ? 5 : 40),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30.0),
        border: isMobile
            ? null
            : Border.all(
                color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B), style: BorderStyle.solid, width: 1.0),
      ),
      child: Stack(
        children: [
          Column(
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
                      const ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: TopStatWithIcon(
                            iconString: 'assets/icons/speedometer.svg',
                            titleString: "Data Throughput",
                            statAmount: "500",
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
                          statAmount: "500",
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
                        padding:
                            EdgeInsets.symmetric(vertical: isMobile ? 20.0 : 32.0, horizontal: isMobile ? 25 : 20.0),
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
                                    Expanded(
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
                                            "500",
                                            style: titleLarge(context),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomTooltip(
                                      tooltipText: Strings.eonTooltipText,
                                      child: const Icon(
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
                                  Expanded(
                                    child: Column(
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
                                          "500",
                                          style: titleLarge(context),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CustomTooltip(
                                    tooltipText: Strings.eraTooltipText,
                                    child: const Icon(
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
                            padding: EdgeInsets.symmetric(
                                vertical: isMobile ? 20.0 : 32.0, horizontal: isMobile ? 20 : 20.0),
                            child: ResponsiveRowColumn(
                              layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                                  ? ResponsiveRowColumnType.COLUMN
                                  : ResponsiveRowColumnType.ROW,
                              columnSpacing: 10.0,
                              children: [
                                const ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: StatInfoCard(
                                    statString: "65",
                                    statSymbol: "Epoch",
                                    firstItem: true,
                                    tooltipText: Strings.epochTooltipText,
                                  ),
                                ),
                                ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: StatInfoCard(
                                      statString: "50",
                                      statSymbol: "Txs",
                                      firstItem: isMobile,
                                      tooltipText: Strings.totalTransactionTooltipText),
                                ),
                                ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: StatInfoCard(
                                    statString: "20",
                                    statSymbol: "Height",
                                    firstItem: isMobile,
                                    tooltipText: Strings.heightTooltipText,
                                  ),
                                ),
                                ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: StatInfoCard(
                                    statString: "10",
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
                                const ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: StatInfoCard(
                                    statString: '${30}%',
                                    statSymbol: "Total Stake",
                                    firstItem: true,
                                    tooltipText: Strings.totalStakeTooltipText,
                                  ),
                                ),
                                ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: StatInfoCard(
                                    statString: "20",
                                    statSymbol: "Registered\nStakes",
                                    firstItem: isMobile,
                                    tooltipText: Strings.registeredStakesTooltipText,
                                  ),
                                ),
                                ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: StatInfoCard(
                                    statString: '${10}%',
                                    statSymbol: "Active\nStakes",
                                    firstItem: isMobile,
                                    tooltipText: Strings.activeStakesTooltipText,
                                  ),
                                ),
                                ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: StatInfoCard(
                                    statString: '${0}%',
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
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xFFF07575),
                      size: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Strings.failedToLoad,
                      style: titleLarge(context),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
