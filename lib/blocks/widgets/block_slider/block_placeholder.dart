import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../shared/constants/strings.dart';
import '../../../shared/theme.dart';
import 'custom_text_button.dart';
import 'multiple_chain_embedding_text.dart';

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
              child: Skeleton.keep(
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
