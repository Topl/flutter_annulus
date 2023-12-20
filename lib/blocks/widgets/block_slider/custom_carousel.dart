import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../shared/constants/ui.dart';
import '../../models/block.dart';
import '../../providers/block_provider.dart';
import 'block_view.dart';

/// Reusable carousel custom widget
class CustomCarousel extends HookConsumerWidget {
  const CustomCarousel({
    super.key,
    required this.blocks,
    required this.controller,
  });

  final List<Block> blocks;
  final CarouselController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;

    Future<AsyncValue<Block>> getBlockValue(int index) async {
      final AsyncValue<Block> block = await ref.watch(
        blockStateAtDepthProvider(index),
      );
      return block;
    }

    double getViewPortFraction(double screenWidth) {
      if (screenWidth >= 3000) {
        return 0.1;
      } else if (ResponsiveBreakpoints.of(context).isTablet) {
        return calculateRatio(
          screenWidth: screenWidth,
          width1: 551,
          ratio1: 1,
          width2: 1023,
          ratio2: 0.45,
        );
      } else if (ResponsiveBreakpoints.of(context).isMobile) {
        return calculateRatio(
          screenWidth: screenWidth,
          width1: 400,
          ratio1: 0.7,
          width2: 550,
          ratio2: 0.55,
        );
      } else if (screenWidth <= 2000) {
        return calculateRatio(
          screenWidth: screenWidth,
          width1: 1025,
          ratio1: 0.45,
          width2: 2000,
          ratio2: 0.18,
        );
      } else {
        return calculateRatio(
          screenWidth: screenWidth,
          width1: 1025,
          ratio1: 0.4,
          width2: 2999,
          ratio2: 0.09,
        );
      }
    }

    return CarouselSlider.builder(
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final blockData = blocks[itemIndex];
        return BlockView(
          block: blockData,
        );
      },
      itemCount: blocks.length,
      options: CarouselOptions(
        initialPage: 0,
        enableInfiniteScroll: false,
        padEnds: false,
        animateToClosest: true,
        viewportFraction: getViewPortFraction(screenWidth),
        height: 360,
      ),
      carouselController: controller,
    );
  }
}
