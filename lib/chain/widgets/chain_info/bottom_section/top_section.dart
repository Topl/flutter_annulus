import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/bottom_section/main_section.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/bottom_section/sub_section.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/stat_info_card.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';

class TopSection extends StatelessWidget {
  final Chain chain;
  final bool isLoading;
  final bool isMobile;
  final ThemeMode colorTheme;
  const TopSection({
    required this.chain,
    required this.isLoading,
    required this.isMobile,
    required this.colorTheme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainSection(
      colorTheme: colorTheme,
      subSection1: SubSection(
        colorTheme: colorTheme,
        statInfoCard1: StatInfoCard(
          statString: chain.epoch.toString(),
          statSymbol: "Epoch",
          tooltipText: Strings.epochTooltipText,
          isLoading: isLoading,
        ),
        statInfoCard2: StatInfoCard(
          statString: chain.totalTransactionsInEpoch.toString(),
          statSymbol: "Txs",
          tooltipText: Strings.totalTransactionTooltipText,
          isLoading: isLoading,
        ),
      ),
      subSection2: SubSection(
        colorTheme: colorTheme,
        statInfoCard1: StatInfoCard(
          statString: chain.height.toString(),
          statSymbol: "Height",
          tooltipText: Strings.heightTooltipText,
          isLoading: isLoading,
        ),
        statInfoCard2: StatInfoCard(
          statString: chain.averageBlockTime.toString(),
          statSymbol: "Avg Block Time",
          tooltipText: Strings.averageBlockTimeTooltipText,
          isLoading: isLoading,
        ),
      ),
      isMobile: isMobile,
    );
  }
}
