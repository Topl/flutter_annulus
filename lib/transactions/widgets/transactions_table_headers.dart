import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransactionTableHeader extends StatelessWidget {
  const TransactionTableHeader({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.columnHeader,
  });

  final bool isMobile;
  final bool isTablet;
  final String columnHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isMobile
              ? 0
              : isTablet
                  ? 25.0
                  : 40.0,
          bottom: 16,
          top: 16),
      child: Text(
        columnHeader,
        style: labelLarge(context),
      ),
    );
  }
}
