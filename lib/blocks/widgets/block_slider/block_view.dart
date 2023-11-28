import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/nav_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/utils/theme_color.dart';
import '../../models/block.dart';

/// Block view widget
class BlockView extends ConsumerWidget {
  final AsyncValue<Block> asyncBlock;

  // Constructor for BlockView widget
  const BlockView({
    Key? key,
    required this.asyncBlock,
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
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: asyncBlock.when(
        error: (error, stackTrace) {
          return const Center(
            child: Text('Error'),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (Block block) {
          return TextButton(
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
                  padding: const EdgeInsets.all(40.0),
                  width: 240,
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
                                  color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                                  style: BorderStyle.solid,
                                  width: 1.0)),
                          child: Image.asset(
                            colorTheme == ThemeMode.light
                                ? 'assets/icons/block-icon.png'
                                : 'assets/icons/dark-block-icon.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(block.height.toString(), style: titleLarge(context)),
                        BlockSmallText(text: blockTimeStampToDifference(block)),
                        const SizedBox(
                          height: 8,
                        ),
                        BlockHeaderText(text: block.epoch.toString()),
                        const BlockSmallText(text: 'Epoch'),
                        const SizedBox(
                          height: 8,
                        ),
                        BlockHeaderText(text: block.header.replaceRange(7, block.header.length, '...')),
                        const BlockSmallText(text: 'Header'),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: BlockHeaderText(
                            text: DateTime.fromMicrosecondsSinceEpoch(block.timestamp).toString().substring(11, 19),
                          ),
                        ),
                        const Expanded(child: BlockSmallText(text: 'UTC')),
                      ]))
              //cardChild,
              );
        },
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
