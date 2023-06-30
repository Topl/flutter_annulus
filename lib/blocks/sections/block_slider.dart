import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
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
    final AsyncValue blocksInfo = ref.watch(blockProvider);
    final colorTheme = ref.watch(appThemeColorProvider);

    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    return blocksInfo.when(
      data: (blocks) => SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
              left: isMobile ? 0 : 40.0,
              right: isMobile ? 0 : 40.0),
          padding: isDesktop || isTablet
              ? const EdgeInsets.only(
                  top: 20.0, bottom: 30.0, left: 0.0, right: 0.0)
              : null,
          decoration: isDesktop || isTablet
              ? BoxDecoration(
                  color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color:
                          getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      style: BorderStyle.solid,
                      width: 1.0),
                )
              : null,
          child: Wrap(
            children: <Widget>[
              ResponsiveRowColumn(
                layout: isMobile
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: isMobile ? 12 : 1,
                    child: isMobile
                        ? MobileBlockViewSlider(
                            controller: _controller,
                            blocks: blocks,
                          )
                        : Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              BlockPlaceHolder(controller: _controller),
                              Expanded(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: CustomCarousel(
                                      blocks: blocks, controller: _controller),
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
      ),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
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
        layout: isMobile
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
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
                        Text(Strings.latestBlocks,
                            style: headlineLarge(context)),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            CustomTextButton(
                              controller: _controller,
                              text: '←',
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
      Strings.multipleChainEmbedding,
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
  }) : _controller = controller;

  final String text;
  final CarouselController _controller;

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
            backgroundColor:
                getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () => {_controller.previousPage()},
          child: Text(text, style: titleMedium(context)),
        ));
  }
}

/// Widget for the visible block view
class VisibleBlockView extends StatelessWidget {
  const VisibleBlockView({
    super.key,
    required this.n1,
    required this.n2,
    required this.n3,
    required this.n4,
    required this.n5,
    required this.blocks,
  });

  final int n1;
  final int n2;
  final int n3;
  final int n4;
  final int n5;
  final List<Block> blocks;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [n1, n2, n3, n4, n5].map((idx) {
      return BlockView(
        block: blocks[idx],
      );
    }).toList());
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
class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
    required this.blocks,
    required this.controller,
  });

  final List<Block> blocks;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIdx) {
        final int first = index * 2;
        final int second = first + 1;
        final int third = second + 1;
        final int fourth = third + 1;
        final int firth = fourth + 1;
        return blocks.isNotEmpty
            ? Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  VisibleBlockView(
                    n1: first,
                    n2: second,
                    n3: third,
                    n4: fourth,
                    n5: firth,
                    blocks: blocks,
                  ),
                ],
              )
            : SizedBox(
                height: 0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      Strings.noBlocksLoaded,
                      style: bodyMedium(context),
                    ),
                  ),
                ),
              );
      },
      itemCount: (blocks.length / 3).round(),
      options: CarouselOptions(
        aspectRatio: 0.6,
        initialPage: 0,
        padEnds: false,
        enlargeCenterPage: true,
        animateToClosest: true,
        viewportFraction: 1,
        height: 360,
      ),
      carouselController: controller,
    );
  }
}
