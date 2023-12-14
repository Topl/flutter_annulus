import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/top_stat_with_icon.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TopChainInfoSection extends StatelessWidget {
  static Key averageTransactionFeeKey(avgFee) => Key('averageTransactionFeeKey-$avgFee');
  static Key dataThroughputKey(throughput) => Key('dataThroughputKey-$throughput');
  final Chain chain;
  final bool isLoading;
  final bool isMobile;
  final ThemeMode colorTheme;

  const TopChainInfoSection({
    required this.chain,
    required this.isLoading,
    required this.isMobile,
    required this.colorTheme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: isMobile ? const EdgeInsets.all(5.0) : const EdgeInsets.all(20.0),
        margin: isMobile
            ? const EdgeInsets.only(
                left: 15,
                bottom: 10.0,
              )
            : null,
        child: ResponsiveRowColumn(
          layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          // columnSpacing: 20.0,
          // rowSpacing: 60.0,
          columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
          columnMainAxisSize: MainAxisSize.min,
          rowMainAxisSize: MainAxisSize.min,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              columnFlex: 3,
              child: TopStatWithIcon(
                iconString: 'assets/icons/speedometer.svg',
                titleString: "Data Throughput",
                statAmount: chain.dataThroughput.toString(),
                statSymbol: " kbps",
                isLoading: isLoading,
                key: dataThroughputKey(chain.dataThroughput.toString()),
              ),
            ),
            ResponsiveRowColumnItem(
              columnFlex: 1,
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
              columnFlex: 3,
              child: TopStatWithIcon(
                key: averageTransactionFeeKey(chain.averageTransactionFee.toString()),
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
    );
  }
}
