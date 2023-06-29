import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';

import '../../chain/sections/add_new_network.dart';
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
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    return Padding(
      padding: EdgeInsets.only(
          left: hideArrowIcon ? 40.0 : 0, bottom: 16, right: 40, top: 16),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: isTablet ? 130 : 160,
            child: Expanded(
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
                    Expanded(
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Rational Display",
                          fontWeight: FontWeight.w500,
                          color: Color(_color(status)),
                        ),
                      ),
                    ),
                  ],
                ),
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
class TableHeaderText extends StatelessWidget {
  const TableHeaderText({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: labelLarge(context),
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

    return Padding(
      padding: EdgeInsets.only(left: isMobile ? 0 : 40.0, bottom: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textTop,
            style: bodyMedium(context),
          ),
          const SizedBox(height: 5),
          isBottomTextRequired
              ? Text(
                  textBottom,
                  style: bodySmall(context),
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
        margin: EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: isMobile ? 20.0 : 40.0,
            right: isMobile ? 20.0 : 40.0),
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

  const CustomStatusWidget({super.key, required this.status});

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

class CustomToast extends StatelessWidget {
  const CustomToast({
    Key? key,
    required this.widget,
    required this.cancel,
    required this.isSuccess,
  }) : super(key: key);

  final AddNewNetworkContainer widget;
  final VoidCallback cancel;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.of(context).between(TABLET, DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return Container(
      height: 64,
      width: isTablet ? 500 : 345,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: getSelectedColor(widget.colorTheme, 0xFFFEFEFE, 0xFF282A2C),
        border: Border.all(
          color: getSelectedColor(widget.colorTheme, 0xFFE0E0E0, 0xFF858E8E),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          isSuccess
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 24,
                )
              : const Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                  size: 24,
                ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              width: 450,
              child: Text(
                isSuccess
                    ? "Network was added ${isMobile ? '\n' : ""} successfully"
                    : "Something went wrong... ${isMobile ? '\n' : ""} Please try again later",
                style: bodyMedium(context),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: cancel,
          ),
        ],
      ),
    );
  }
}
