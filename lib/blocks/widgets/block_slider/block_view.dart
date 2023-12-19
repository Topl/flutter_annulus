import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/nav_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/utils/theme_color.dart';
import '../../models/block.dart';

/// Block view widget
class BlockView extends ConsumerWidget {
  final Block block;

  static Key blockItemKey(String blockId) => Key('blockItem-$blockId');

  // Constructor for BlockView widget
  const BlockView({
    Key? key,
    required this.block,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    final colorTheme = ref.watch(appThemeColorProvider);
    return Container(
      width: 240,
      height: 344,
      margin: EdgeInsets.only(left: isMobile ? 6.0 : 0.0, right: 0.0, bottom: 0.0, top: 20.0),
      decoration: BoxDecoration(
        color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: TextButton(
          key: blockItemKey(block.header),
          onPressed: () {
            goToBlockDetails(
              context: context,
              block: block,
            );
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.white.withOpacity(0.0);
                }
                if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
                  return Colors.blue.withOpacity(0.12);
                }
                return null; // Defer to the widget's default.
              },
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0, bottom: 24.0),
            width: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton.keep(
                  child: SizedBox(
                    child: Image.asset(
                      'assets/icons/block-icon.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Skeleton.replace(
                  height: 28,
                  width: 120,
                  replacement: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    block.height.toString(),
                    style: titleLarge(context),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Skeleton.replace(
                  height: 16,
                  width: 80,
                  replacement: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: BlockSmallText(
                    text: blockTimeStampToDifference(block),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Skeleton.replace(
                  height: 16,
                  width: 80,
                  replacement: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: BlockHeaderText(
                    text: block.epoch.toString(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Skeleton.replace(
                  height: 16,
                  width: 56,
                  replacement: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const BlockSmallText(text: 'Epoch'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Skeleton.replace(
                  height: 16,
                  width: 80,
                  replacement: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: BlockHeaderText(text: block.header),
                ),
                const SizedBox(
                  height: 8,
                ),
                Skeleton.replace(
                  height: 16,
                  width: 56,
                  replacement: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const BlockSmallText(text: 'Header'),
                ),
                const SizedBox(
                  height: 16,
                ),
                Skeleton.replace(
                  height: 16,
                  width: 80,
                  replacement: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: BlockHeaderText(
                    text: DateTime.fromMicrosecondsSinceEpoch(block.timestamp).toString().substring(11, 19),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Skeleton.replace(
                  height: 16,
                  width: 56,
                  replacement: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const BlockSmallText(text: 'UTC'),
                ),
              ],
            ),
          )
          //cardChild,
          ),
    );
  }
}

class BlockHeaderText extends StatelessWidget {
  const BlockHeaderText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: titleSmall(context),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

//
class BlockSmallText extends StatelessWidget {
  const BlockSmallText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: bodySmall(context),
    );
  }
}
