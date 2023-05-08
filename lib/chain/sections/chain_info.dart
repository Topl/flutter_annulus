import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/lower_stats_without_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/chain_info/top_stat_with_icon.dart';
import '../widgets/chain_info/lower_stat_with_icon.dart';

class ChainInfo extends HookConsumerWidget {
  const ChainInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(right: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: const Color(0xFFE7E8E8),
            style: BorderStyle.solid,
            width: 1.0),
      ),
      height: 408,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Top Metrics
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(42.0),
              child: Row(
                children: [
                  TopStatWithIcon(
                      iconString: 'images/speedometer.svg',
                      titleString: "Data Throughput",
                      statAmount: "39.887",
                      statSymbol: " kbps",
                      firstItem: true),
                  const VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Color(0xFFE7E8E8),
                  ),
                  TopStatWithIcon(
                    iconString: 'images/coin.svg',
                    titleString: "Average Transaction Fee",
                    statAmount: "3.71",
                    statSymbol: " LVL",
                  ),
                  const VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Color(0xFFE7E8E8),
                  ),
                  TopStatWithIcon(
                    iconString: 'images/wallet.svg',
                    titleString: "Unique Active Addresses",
                    statAmount: "2,076",
                    statSymbol: " /3,135",
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xFFE7E8E8),
            indent: 0,
            height: 1,
          ),
          //Bottom Metrics
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 40.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Eon",
                              style: TextStyle(
                                color: Color(0xFF858E8E),
                                fontSize: 16,
                                fontFamily: 'Rational Display',
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                color: Color(0xFF282A2C),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Rational Display',
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Era",
                              style: TextStyle(
                                color: Color(0xFF858E8E),
                                fontSize: 16,
                                fontFamily: 'Rational Display',
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                color: Color(0xFF282A2C),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Rational Display',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                    indent: 0, color: Color(0xFFE7E8E8), width: 1),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          child: Row(
                            children: [
                              LowerStatWithoutIcon(
                                statValue: "72,109",
                                statSymbol: "Epoch",
                                firstItem: true,
                              ),
                              const VerticalDivider(
                                indent: 5,
                                endIndent: 10,
                                thickness: 1,
                                color: Color(0xFFE7E8E8),
                                width: 1,
                              ),
                              LowerStatWithoutIcon(
                                statValue: "266",
                                statSymbol: "Txs",
                              ),
                              const VerticalDivider(
                                indent: 5,
                                endIndent: 10,
                                thickness: 1,
                                color: Color(0xFFE7E8E8),
                              ),
                              LowerStatWithoutIcon(
                                statValue: "22,100,762",
                                statSymbol: "Height",
                              ),
                              const VerticalDivider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 1,
                                width: 1,
                                color: Color(0xFFE7E8E8),
                              ),
                              LowerStatWithoutIcon(
                                statValue: "127 sec",
                                statSymbol: "Avg Block Time",
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color(0xFFE7E8E8),
                        indent: 0,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          child: Row(
                            children: [
                              LowerStatWithIcon(
                                  icon: Icons.info_outline,
                                  statString: "77%",
                                  statSymbol: "Total Stake"),
                              const VerticalDivider(
                                indent: 5,
                                endIndent: 10,
                                thickness: 1,
                                color: Color(0xFFE7E8E8),
                              ),
                              LowerStatWithIcon(
                                  icon: Icons.info_outline,
                                  statString: "519",
                                  statSymbol: "Registered Stakes"),
                              const VerticalDivider(
                                indent: 5,
                                endIndent: 10,
                                thickness: 1,
                                color: Color(0xFFE7E8E8),
                              ),
                              LowerStatWithIcon(
                                  icon: Icons.info_outline,
                                  statString: "453",
                                  statSymbol: "Active Stakes"),
                              const VerticalDivider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 1,
                                color: Color(0xFFE7E8E8),
                              ),
                              LowerStatWithIcon(
                                  icon: Icons.info_outline,
                                  statString: "66",
                                  statSymbol: "Inactive Stakes"),
                            ],
                          ),
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
