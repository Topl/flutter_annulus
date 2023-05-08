import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/lower_stats_without_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    return chainInfo.when(
      data: (chain) => Container(
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
                        statAmount: chain.dataThroughput.toString(),
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
                      statAmount: chain.averageTransactionFee.toString(),
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
                      statAmount: chain.uniqueActiveAddresses.toString(),
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
                            children: [
                              const Text(
                                "Eon",
                                style: TextStyle(
                                  color: Color(0xFF858E8E),
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                chain.eon.toString(),
                                style: const TextStyle(
                                  color: Color(0xFF282A2C),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Era",
                                style: TextStyle(
                                  color: Color(0xFF858E8E),
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                chain.era.toString(),
                                style: const TextStyle(
                                  color: Color(0xFF282A2C),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
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
                                  statValue: chain.epoch.toString(),
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
                                  statValue:
                                      chain.totalTransactionsInEpoch.toString(),
                                  statSymbol: "Txs",
                                ),
                                const VerticalDivider(
                                  indent: 5,
                                  endIndent: 10,
                                  thickness: 1,
                                  color: Color(0xFFE7E8E8),
                                ),
                                LowerStatWithoutIcon(
                                  statValue: chain.height.toString(),
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
                                  statValue: chain.averageBlockTime.toString(),
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
                                    statString:
                                        '${chain.totalStake.toString()}%',
                                    statSymbol: "Total Stake"),
                                const VerticalDivider(
                                  indent: 5,
                                  endIndent: 10,
                                  thickness: 1,
                                  color: Color(0xFFE7E8E8),
                                ),
                                LowerStatWithIcon(
                                    icon: Icons.info_outline,
                                    statString:
                                        chain.registeredStakes.toString(),
                                    statSymbol: "Registered Stakes"),
                                const VerticalDivider(
                                  indent: 5,
                                  endIndent: 10,
                                  thickness: 1,
                                  color: Color(0xFFE7E8E8),
                                ),
                                LowerStatWithIcon(
                                    icon: Icons.info_outline,
                                    statString:
                                        '${chain.activeStakes.toString()}%',
                                    statSymbol: "Active Stakes"),
                                const VerticalDivider(
                                  indent: 10,
                                  endIndent: 10,
                                  thickness: 1,
                                  color: Color(0xFFE7E8E8),
                                ),
                                LowerStatWithIcon(
                                    icon: Icons.info_outline,
                                    statString:
                                        '${chain.inactiveStakes.toString()}%',
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
      ),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
