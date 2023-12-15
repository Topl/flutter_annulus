import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/bottom_section/sub_section.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainSection extends StatelessWidget {
  final SubSection subSection1;
  final SubSection subSection2;
  final bool isMobile;
  final ThemeMode colorTheme;
  const MainSection({
    required this.subSection1,
    required this.subSection2,
    required this.isMobile,
    required this.colorTheme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 20.0 : 32.0,
        horizontal: isMobile ? 20 : 20.0,
      ),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        columnSpacing: 10.0,
        columnMainAxisSize: MainAxisSize.min,
        rowMainAxisSize: MainAxisSize.min,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnFlex: 1,
            columnFit: FlexFit.loose,
            rowFit: FlexFit.loose,
            child: subSection1,
          ),
          if (!isMobile)
            ResponsiveRowColumnItem(
              child: SizedBox(
                height: 50,
                child: VerticalDivider(
                  thickness: 1,
                  color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                ),
              ),
            ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnFlex: 1,
            columnFit: FlexFit.loose,
            rowFit: FlexFit.loose,
            child: subSection2,
          ),
        ],
      ),
    );
  }
}
