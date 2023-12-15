import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/bottom_section/main_section.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/bottom_section/sub_section.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/stat_info_card.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';

class BottomSection extends StatelessWidget {
  final Chain chain;
  final bool isLoading;
  final bool isMobile;
  final ThemeMode colorTheme;
  const BottomSection({
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
          statString: '${chain.totalRegisteredStake.toString()}%',
          statSymbol: Strings.totalRegisteredStake,
          tooltipText: Strings.totalStakeTooltipText,
          isLoading: isLoading,
        ),
        statInfoCard2: StatInfoCard(
          statString: chain.totalStakes.toString(),
          statSymbol: Strings.totalStakes,
          tooltipText: Strings.totalStakesTooltipText,
          isLoading: isLoading,
        ),
      ),
      subSection2: SubSection(
        colorTheme: colorTheme,
        statInfoCard1: StatInfoCard(
          statString: chain.activeStakes.toString(),
          statSymbol: Strings.activeStakes,
          tooltipText: Strings.activeStakesTooltipText,
          isLoading: isLoading,
        ),
        statInfoCard2: StatInfoCard(
          statString: chain.inactiveStakes.toString(),
          statSymbol: "Inactive\nStakes",
          tooltipText: Strings.invalidStakesTooltipText,
          isLoading: isLoading,
        ),
      ),
      isMobile: isMobile,
    );
  }
}
