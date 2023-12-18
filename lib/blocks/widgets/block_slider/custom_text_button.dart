import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/theme.dart';
import '../../../shared/utils/theme_color.dart';

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
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
            color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B), style: BorderStyle.solid, width: 2.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          fixedSize: isMobile ? const Size(46, 46) : const Size(56, 56),
          textStyle: titleMedium(context),
          backgroundColor: getSelectedColor(colorTheme, 0xFFFFFFFF, 0xFF434648),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () => {
          isPrevious ? _controller.previousPage() : _controller.nextPage(),
        },
        child: Text(
          text,
          style: titleMedium(context),
        ),
      ),
    );
  }
}
