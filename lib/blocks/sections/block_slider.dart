import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/shared/constants/ui.dart';
import 'package:flutter_annulus/shared/providers/snackbar_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../../shared/utils/theme_color.dart';
import '../providers/block_provider.dart';
import '../widgets/block_slider/block_view.dart';
import '../../shared/constants/strings.dart';

/// Widget for the block view slider
class BlockViewSlider extends HookConsumerWidget {
  BlockViewSlider({super.key});

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);

    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    return ref.watch(blockProvider).when(
          data: (Map<int, Block> blocks) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: isMobile ? 0 : 40.0, right: isMobile ? 0 : 40.0),
                padding: isDesktop || isTablet
                    ? const EdgeInsets.only(top: 20.0, bottom: 30.0, left: 0.0, right: 0.0)
                    : null,
                decoration: isDesktop || isTablet
                    ? BoxDecoration(
                        color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                            style: BorderStyle.solid,
                            width: 1.0),
                      )
                    : null,
                child: Wrap(
                  children: <Widget>[
                    ResponsiveRowColumn(
                      layout: isMobile ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                      children: [
                        ResponsiveRowColumnItem(
                          rowFlex: isMobile ? 12 : 1,
                          child: isMobile
                              ? MobileBlockViewSlider(
                                  controller: _controller,
                                  blocks: blocks.values.toList(),
                                )
                              : Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    BlockPlaceHolder(controller: _controller),
                                    Expanded(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.7,
                                        child: CustomCarousel(
                                          blocks: blocks.values.toList(),
                                          controller: _controller,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stack) {
            ref.read(snackbarProvider)(context);
            return const SizedBox();
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}

/// Widget for the visible block view
class BlockPlaceHolder extends HookConsumerWidget {
  const BlockPlaceHolder({
    super.key,
    required CarouselController controller,
  }) : _controller = controller;

  final CarouselController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    return SizedBox(
      width: isMobile ? 400 : 240,
      child: ResponsiveRowColumn(
        layout: isMobile ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
        children: [
          if (!isMobile)
            ResponsiveRowColumnItem(
              rowFlex: 12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text(Strings.latestBlocks, style: headlineLarge(context)),
                  const SizedBox(height: 10),
                  const MultipleChainText(sizeFont: 16),
                  const SizedBox(height: 168),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: CustomTextButton(
                          controller: _controller,
                          text: '←',
                          isPrevious: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: CustomTextButton(
                          controller: _controller,
                          text: '→',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (isMobile)
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 18,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(Strings.latestBlocks, style: headlineLarge(context))),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            CustomTextButton(
                              controller: _controller,
                              text: '←',
                              isPrevious: true,
                            ),
                            const SizedBox(width: 10),
                            CustomTextButton(
                              controller: _controller,
                              text: '→',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const MultipleChainText(sizeFont: 12),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Latest Blocks Text Widget

/// Multiple-chain Embedding Text Widget
class MultipleChainText extends StatelessWidget {
  const MultipleChainText({
    super.key,
    required this.sizeFont,
  });
  final double sizeFont;
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return Text(
      "Multiple-chain Embedding",
      style: isMobile ? bodySmall(context) : titleMedium(context),
    );
  }
}

/// Custom Text Button widget
class CustomTextButton extends ConsumerWidget {
  const CustomTextButton({
    super.key,
    required CarouselController controller,
    required this.text,
    this.isPrevious = false,
  }) : _controller = controller;

  final String text;
  final CarouselController _controller;
  final bool isPrevious;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    final colorTheme = ref.watch(appThemeColorProvider);
    return Container(
        width: isMobile ? 40 : null,
        height: isMobile ? 40 : null,
        decoration: BoxDecoration(
          borderRadius: isMobile ? BorderRadius.circular(20.0) : null,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            fixedSize: isMobile ? const Size(46, 46) : const Size(56, 56),
            textStyle: titleMedium(context),
            backgroundColor: getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () => {
            isPrevious ? _controller.previousPage() : _controller.nextPage(),
          },
          child: Text(
            text,
            style: titleMedium(context),
          ),
        ));
  }
}

/// widget for Mobile Block
class MobileBlockViewSlider extends StatelessWidget {
  final CarouselController controller;
  final List<Block> blocks;

  const MobileBlockViewSlider({
    Key? key,
    required this.controller,
    required this.blocks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlockPlaceHolder(controller: controller),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomCarousel(blocks: blocks, controller: controller),
        ),
      ],
    );
  }
}

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
        if (blocks.isNotEmpty) {
          final AsyncValue<Block> block = ref.watch(blockStateAtDepthProvider(itemIndex));
          return BlockView(
            asyncBlock: block,
          );
        } else {
          return SizedBox(
            height: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "No blocks loaded",
                  style: bodyMedium(context),
                ),
              ),
            ),
          );
        }
      },
      itemCount: 100,
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
