import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../shared/theme.dart';

class CustomTooltip extends HookWidget {
  CustomTooltip({super.key, required this.child, required this.tooltipText});

  final Widget child;
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    final controller = SuperTooltipController();

    return SizedBox(
      child: GestureDetector(
        onTap: () async {
          await controller.showTooltip();
        },
        child: SuperTooltip(
          showBarrier: true,
          controller: controller,
          popupDirection: TooltipDirection.up,
          content: Text(
            tooltipText,
            softWrap: true,
            style: bodyMedium(context),
          ),
          child: child,
        ),
      ),
    );
  }
}
