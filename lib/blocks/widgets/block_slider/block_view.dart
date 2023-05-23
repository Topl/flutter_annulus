import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_details_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/utils/theme_color.dart';
import '../../models/block.dart';

/// Block view widget
class BlockView extends ConsumerWidget {
  final Block block;

  // Constructor for BlockView widget
  const BlockView({
    Key? key,
    required this.block,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return SizedBox(
      child: TextButton(
          onPressed: () {
            showModalSideSheet(
                context: context,
                ignoreAppBar: false,
                width: 640,
                barrierColor:
                    getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF353739)
                        .withOpacity(0.64),
                barrierDismissible: true,
                body: BlockDetailsDrawer(block: block));
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.white.withOpacity(0.0);
                }
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return Colors.blue.withOpacity(0.12);
                }
                return null; // Defer to the widget's default.
              },
            ),
          ),
          child: Container(
              width: 240,
              height: 344,
              margin: const EdgeInsets.only(
                  left: 20.0, right: 0.0, bottom: 0.0, top: 20.0),
              padding: const EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                  color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                      color:
                          getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      style: BorderStyle.solid,
                      width: 1.0)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                              color: getSelectedColor(
                                  colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                              style: BorderStyle.solid,
                              width: 1.0)),
                      child: Image.asset(
                        colorTheme == ColorMode.light
                            ? 'assets/icons/block-icon.png'
                            : 'assets/icons/dark-block-icon.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(block.height.toString(),
                        style: TextStyle(
                            color: getSelectedColor(
                                colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            fontFamily: 'Rational Display',
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.002)),
                    const BlockSmallText(text: '12 sec ago'),
                    const SizedBox(
                      height: 20,
                    ),
                    BlockHeaderText(text: block.epoch.toString()),
                    const BlockSmallText(text: 'Epoch'),
                    const SizedBox(
                      height: 8,
                    ),
                    BlockHeaderText(
                        text: block.header
                            .replaceRange(7, block.header.length, '...')),
                    const BlockSmallText(text: 'Header'),
                    const SizedBox(
                      height: 8,
                    ),
                    BlockHeaderText(
                      text: DateTime.fromMicrosecondsSinceEpoch(block.timestamp)
                          .toString()
                          .substring(11, 19),
                    ),
                    const BlockSmallText(text: 'UTC'),
                  ]))
          //cardChild,
          ),
    );
  }
}

class BlockHeaderText extends HookConsumerWidget {
  const BlockHeaderText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Text(text,
        style: TextStyle(
          color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE),
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rational Display Medium',
          fontStyle: FontStyle.normal,
        ));
  }
}

//
class BlockSmallText extends HookConsumerWidget {
  const BlockSmallText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Text(text,
        style: TextStyle(
          color: getSelectedColor(colorTheme, 0xFF858E8E, 0xFFC0C4C4),
          fontWeight: FontWeight.w400,
          fontSize: 12,
          fontFamily: 'Rational Display Light',
          fontStyle: FontStyle.normal,
        ));
  }
}
