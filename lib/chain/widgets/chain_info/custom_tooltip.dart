import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../shared/theme.dart';

class CustomTooltip extends StatefulWidget {
  const CustomTooltip(
      {super.key, required this.child, required this.tooltipText});

  final Widget child;
  final String tooltipText;

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  final _controller = SuperTooltipController();

  String get tooltipText => widget.tooltipText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () async {
          await _controller.showTooltip();
        },
        child: SuperTooltip(
          showBarrier: true,
          controller: _controller,
          popupDirection: TooltipDirection.up,
          content: Text(
            tooltipText,
            softWrap: true,
            style: bodyMedium(context),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
