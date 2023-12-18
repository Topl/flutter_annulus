import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../providers/block_provider.dart';
import '../utils/utils.dart';
import '../widgets/blocks_container.dart';

/// Widget for the block view slider
class BlockViewSlider extends HookConsumerWidget {
  const BlockViewSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);

    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    return ref.watch(blockProvider).when(
          data: (Map<int, Block> blocks) {
            return BlocksContainer(
                isMobile: isMobile, isDesktop: isDesktop, isTablet: isTablet, colorTheme: colorTheme, blocks: blocks);
          },
          error: (error, stack) => const Text('Oops, something unexpected happened'),
          loading: () {
            final List<Block> blocks = List.generate(
              10,
              (index) => getMockBlock(index),
            );
            return Skeletonizer(
              child: BlocksContainer(
                isMobile: isMobile,
                isDesktop: isDesktop,
                isTablet: isTablet,
                colorTheme: colorTheme,
                blocks: blocks.asMap(),
              ),
            );
          },
        );
  }
}

/// Latest Blocks Text Widget
