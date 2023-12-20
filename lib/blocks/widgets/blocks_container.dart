import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../shared/utils/theme_color.dart';
import '../models/block.dart';
import 'block_slider/block_placeholder.dart';
import 'block_slider/custom_carousel.dart';
import 'block_slider/mobile_blockview_slider.dart';

class BlocksContainer extends StatelessWidget {
  BlocksContainer({
    super.key,
    required this.isMobile,
    required this.isDesktop,
    required this.isTablet,
    required this.colorTheme,
    required this.blocks,
  });

  final CarouselController _controller = CarouselController();

  final bool isMobile;
  final bool isDesktop;
  final bool isTablet;
  final ThemeMode colorTheme;
  final Map<int, Block> blocks;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: isMobile ? 0 : 40.0, right: isMobile ? 0 : 40.0),
        padding: isDesktop || isTablet ? const EdgeInsets.only(top: 20.0, bottom: 30.0, left: 0.0, right: 0.0) : null,
        decoration: isDesktop || isTablet
            ? BoxDecoration(
                color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B), style: BorderStyle.solid, width: 1.0),
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
  }
}
