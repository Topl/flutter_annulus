import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/utils/chain_utils.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/main_chain_info_section.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../providers/chain_statistics_provider.dart';

class ChainInfo extends HookConsumerWidget {
  const ChainInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Chain> chainInfo = ref.watch(chainStatisticsProvider);

    return chainInfo.when(
      data: (chain) => MainChainInfoSection(
        chain: chain,
      ),
      error: (error, stack) => const Text('Oops, something unexpected happened'),
      loading: () {
        final mockChain = getMockChain();
        return Skeletonizer(
          
          child: MainChainInfoSection(
            isLoading: true,
            chain: mockChain,
          ),
        );
      },
    );
  }
}
