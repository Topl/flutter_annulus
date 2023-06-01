import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import '../../shared/utils/theme_color.dart';
import '../sections/transactions.dart';

/// Custom Status Button Widget
class StatusButton extends ConsumerWidget {
  const StatusButton(
      {super.key, this.status = "pending", this.hideArrowIcon = true});
  final String status;
  final bool hideArrowIcon;

  /// Function to return color based on status
  int _color(String statusSelected) {
    if (statusSelected == "Pending") {
      return 0xFF7040EC;
    } else if (statusSelected == "Confirmed") {
      return 0xFF4BBF6B;
    } else {
      return 0xFFF07575;
    }
  }

  // Function to return icon based on status
  IconData _icon(String statusSelected) {
    if (statusSelected == "Pending") {
      return Icons.access_time;
    } else if (statusSelected == "Confirmed") {
      return Icons.check;
    } else {
      return Icons.clear;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Padding(
      padding: EdgeInsets.only(
          left: hideArrowIcon ? 40.0 : 0, bottom: 16, right: 40, top: 16),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 160,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Color(_color(status)).withOpacity(0.04),
                // add opacity to the color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    _icon(status),
                    color: Color(_color(status)),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Rational Display",
                      fontWeight: FontWeight.w500,
                      color: Color(_color(status)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 42.0,
          ),
          hideArrowIcon
              ? Icon(
                  Icons.arrow_forward_ios,
                  color: getSelectedColor(colorTheme, 0xFF858E8E, 0xFFC0C4C4),
                  size: 14,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

/// Custom Widgets - Table Header Text Widget
class TableHeaderText extends ConsumerWidget {
  const TableHeaderText({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Text(
      name,
      style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          fontFamily: "Rational Display",
          color: getSelectedColor(colorTheme, 0xFF858E8E, 0xFFC0C4C4)),
    );
  }
}

/// Custom Transaction Column Text Widget
class TransactionColumnText extends ConsumerWidget {
  const TransactionColumnText({
    super.key,
    required this.textTop,
    required this.textBottom,
    this.isBottomTextRequired = true,
  });

  final String textTop;
  final String textBottom;
  final bool isBottomTextRequired;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    final colorTheme = ref.watch(appThemeColorProvider);
    return Padding(
      padding: EdgeInsets.only(left: isMobile ? 0 : 40.0, bottom: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textTop,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Rational Display",
              color: getSelectedColor(colorTheme, 0xFF535757, 0xFFC0C4C4),
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 5),
          isBottomTextRequired
              ? Text(
                  textBottom,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontFamily: "Rational Display",
                    color: Color(0xFF858E8E),
                    fontWeight: FontWeight.w300,
                  ),
                )
              : const SizedBox(height: 0),
        ],
      ),
    );
  }
}

class CustomContainer extends HookConsumerWidget {
  const CustomContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    return Container(
        margin: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 30.0,
          left: 0.0,
          right: 0.0,
        ),
        width: isMobile ? 670 : null,
        decoration: BoxDecoration(
          color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        child: Expanded(
          child: child,
        ));
  }
}

/// Widget for Transaction Status
class CustomStatusWidget extends StatelessWidget {
  final String status;

  const CustomStatusWidget({Key? key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
// ResponsiveColumn

    return ResponsiveRowColumn(
        layout: isMobile
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const SizedBox(
                          width: 172,
                          child: CustomTextLeft(desc: 'Status'),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        StatusButton(
                          status: status,
                          hideArrowIcon: false,
                        ),
                      ],
                    )
                  : const Row(
                      children: [
                        Spacing(),
                        SizedBox(
                          width: 172,
                          child: CustomTextLeft(desc: 'Status'),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        StatusButton(
                          status: 'Confirmed',
                          hideArrowIcon: false,
                        ),
                      ],
                    ))
        ]);
  }
}

/// widget for Responsive Column row
class CustomResponsiveRowColumn extends StatelessWidget {
  final List<Widget> children;

  const CustomResponsiveRowColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    final layout =
        isMobile ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW;

    return ResponsiveRowColumn(
      layout: layout,
      children: children.map((child) {
        return ResponsiveRowColumnItem(
          rowFlex: isMobile ? 3 : 2,
          child: Padding(
            padding: isMobile
                ? const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10)
                : EdgeInsets.zero,
            child: child,
          ),
        );
      }).toList(),
    );
  }
}

/// widget for Custom Row With Text
class CustomRowWithText extends StatelessWidget {
  final String rightText;
  final String leftText;
  final bool hasIcon;
  const CustomRowWithText(
      {Key? key,
      required this.leftText,
      required this.rightText,
      this.hasIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return Row(
      children: [
        const Spacing(),
        SizedBox(
          width: 172,
          child: CustomTextLeft(desc: leftText),
        ),
        const SizedBox(
          width: 24,
        ),
        Row(
          children: [
            CustomTextRight(desc: rightText),
            Padding(
                padding: !isMobile
                    ? const EdgeInsets.only(
                        top: 0, bottom: 0, left: 10, right: 0)
                    : EdgeInsets.zero,
                child: hasIcon ? const Icon(Icons.copy) : null),
          ],
        ),
      ],
    );
  }
}

/// widget for Custom Column With Text
class CustomColumnWithText extends StatelessWidget {
  final String leftText;
  final String rightText;
  final bool hasIcon;

  const CustomColumnWithText({
    Key? key,
    required this.leftText,
    required this.rightText,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 172,
          child: CustomTextLeft(desc: leftText),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: [
            CustomTextRight(desc: rightText),
            Padding(
                padding: isMobile
                    ? const EdgeInsets.only(
                        top: 0, bottom: 0, left: 10, right: 0)
                    : EdgeInsets.zero,
                child: hasIcon ? const Icon(Icons.copy) : null),
          ],
        ),
      ],
    );
  }
}

/// widget for custom padding
class CustomPadding extends StatelessWidget {
  final Widget child;

  const CustomPadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    return Padding(
      padding: isMobile
          ? const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10)
          : EdgeInsets.zero,
      child: child,
    );
  }
}
