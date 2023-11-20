import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';

import '../constants/strings.dart';
import '../utils/theme_color.dart';

class FooterContent extends StatelessWidget {
  const FooterContent({
    super.key,
    required this.colorTheme,
  });

  final ThemeMode colorTheme;

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: isTablet ? EdgeInsets.zero : const EdgeInsets.only(left: 10),
          padding: isTablet ? const EdgeInsets.only(right: 60) : EdgeInsets.zero,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              Strings.footerColumn5Header,
              style: TextStyle(
                color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFC0C4C4),
                fontSize: 16,
                fontFamily: Strings.rationalDisplayFont,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Container(
          margin: isTablet ? EdgeInsets.zero : const EdgeInsets.only(right: 10, left: 10),
          padding: isTablet ? const EdgeInsets.only(left: 50) : EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              isTablet
                  ? CustomFooterTextField(isTablet: isTablet)
                  : Expanded(
                      child: CustomFooterTextField(isTablet: isTablet),
                    ),
              const SizedBox(width: 8),
              SizedBox(
                height: 40,
                width: 102,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648),
                    ),
                  ),
                  onPressed: null,
                  child: Text(
                    Strings.subscribe,
                    style: TextStyle(
                      color: getSelectedColor(colorTheme, 0xFF000000, 0xFFFEFEFE),
                      fontSize: 14,
                      fontFamily: Strings.rationalDisplayFont,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomFooterTextField extends StatelessWidget {
  const CustomFooterTextField({
    super.key,
    required this.isTablet,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isTablet ? 200 : double.infinity,
      height: 40,
      child: TextField(
        controller: TextEditingController(text: ''),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0xFFE2E3E3), width: 1),
          ),
          hintText: Strings.email,
        ),
      ),
    );
  }
}

class ResponsiveFooter extends StatelessWidget {
  const ResponsiveFooter({
    Key? key,
    required this.colorTheme,
    required this.rowIcons,
  }) : super(key: key);

  final ThemeMode colorTheme;
  final Widget rowIcons;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: isMobile
              ? Column(
                  children: [
                    FooterContent(colorTheme: colorTheme),
                    const SizedBox(height: 30),
                    Container(width: 400, padding: const EdgeInsets.only(left: 10), child: rowIcons),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FooterContent(colorTheme: colorTheme),
                    Container(padding: const EdgeInsets.only(right: 35), child: rowIcons),
                  ],
                ),
        ),
      ],
    );
  }
}
