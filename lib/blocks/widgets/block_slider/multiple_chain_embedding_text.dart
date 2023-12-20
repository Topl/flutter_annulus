import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../shared/theme.dart';

/// Multiple-chain Embedding Text Widget
class MultipleChainText extends StatelessWidget {
  const MultipleChainText({
    super.key,
    required this.sizeFont,
  });

  final double sizeFont;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return Text(
      "Multiple-chain Embedding",
      style: isMobile ? bodySmall(context) : titleMedium(context),
    );
  }
}
