import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/utils/chain_utils.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/main_chain_info_section.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../shared/widgets/failed_to_load.dart';
import '../providers/chain_statistics_provider.dart';

class ChainInfo extends HookConsumerWidget {
  static const chainInfoKey = Key('ChainInfo');
  static const Key loadingChainInfoKey = Key('LoadingChainInfo');

  const ChainInfo() : super(key: chainInfoKey);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Chain> chainInfo = ref.watch(chainStatisticsProvider);

    return chainInfo.when(
      data: (chain) {
        return MainChainInfoSection(
          chain: chain,
        );
      },
      error: (error, stack) {
        final mockChain = getMockChain();
        return Stack(
          children: [
            MainChainInfoSection(
              chain: mockChain,
              isError: true,
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: const FailedToLoad(),
                ),
              ),
            )
          ],
        );
      },
      loading: () {
        final mockChain = getMockChain();
        return Skeletonizer(
          key: loadingChainInfoKey,
          child: MainChainInfoSection(
            isLoading: true,
            chain: mockChain,
          ),
        );
      },
    );
  }
}
