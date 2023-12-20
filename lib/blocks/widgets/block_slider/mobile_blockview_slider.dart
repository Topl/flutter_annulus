import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../models/block.dart';
import 'block_placeholder.dart';
import 'custom_carousel.dart';

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
