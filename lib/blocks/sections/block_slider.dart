import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../../shared/utils/theme_color.dart';
import '../providers/block_provider.dart';
import '../widgets/block_slider/block_view.dart';

class BlockViewSlider extends HookConsumerWidget {
  BlockViewSlider({super.key});

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue blocksInfo = ref.watch(blockProvider);
    final colorTheme = ref.watch(appThemeColorProvider);
    return blocksInfo.when(
      data: (blocks) => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              top: 20.0, bottom: 20.0, left: 80.0, right: 80.0),
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 30.0, left: 0.0, right: 0.0),
          decoration: BoxDecoration(
            color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                style: BorderStyle.solid,
                width: 1.0),
          ),
          child: Wrap(
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  BlockPlaceHolder(controller: _controller),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: CarouselSlider.builder(
                      itemBuilder: (context, index, realIdx) {
                        final int first = index * 2;
                        final int second = first + 1;
                        final int third = second + 1;
                        final int fourth = third + 1;
                        final int firth = fourth + 1;
                        return blocks.isNotEmpty
                            ? Wrap(
                                direction: Axis
                                    .vertical, // main axis (rows or columns)
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
                            : const SizedBox(
                                height: 0,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      "No blocks loaded",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF282A2C),
                                          fontFamily: "Rational Display"),
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
                          height: 360),
                      carouselController: _controller,
                    ),
                  ),
                ],
              )
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

// Widget for the visible block view
class BlockPlaceHolder extends ConsumerWidget {
  const BlockPlaceHolder({
    super.key,
    required CarouselController controller,
  }) : _controller = controller;

  final CarouselController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return SizedBox(
      width: 240,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "Latest Blocks",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                fontFamily: "Rational Display"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Multiple-chain Embedding",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF858E8E),
                  fontFamily: "Rational Display")),
          const SizedBox(
            height: 168,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: CustomTextButton(controller: _controller, text: '←'),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: CustomTextButton(controller: _controller, text: '→'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Text Button widget
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
    final colorTheme = ref.watch(appThemeColorProvider);
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size(56, 56),
        textStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648),
      ),
      onPressed: () => _controller.previousPage(),
      child: Text(text,
          style: TextStyle(
            color: getSelectedColor(colorTheme, 0xFF535757, 0xFFAFB6B6),
          )),
    );
  }
}

// Widget for the visible block view
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
        blockEpoch: blocks[idx].epoch.toString(),
        blockHeight: blocks[idx].height.toString(),
        blockTime: blocks[idx].timestamp,
        blockHeader: blocks[idx].header.toString(),
      );
    }).toList());
  }
}
