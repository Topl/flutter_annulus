import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/sections/chain_info.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ChainSection extends StatelessWidget {
  const ChainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      columnPadding: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
          ? const EdgeInsets.symmetric(vertical: 20)
          : const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      columnSpacing: 30,
      columnMainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ResponsiveRowColumnItem(
          rowFlex: 3,
          child: ChainInfo(),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 2,
          child: Container(
            color: Colors.red,
            height: 300,
            child: const Center(
              child: Text("Chart here"),
            ),
          ),
        ),
      ],
    );
  }
}
