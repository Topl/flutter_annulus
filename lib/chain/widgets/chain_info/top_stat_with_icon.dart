import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// TopStatWithIcon Widget that displays a stat with an icon on top of it.
class TopStatWithIcon extends ConsumerWidget {
  final String iconString;
  final String titleString;
  final String statAmount;
  final String statSymbol;
  final bool isLoading;

  const TopStatWithIcon({
    super.key,
    required this.iconString,
    required this.titleString,
    required this.statAmount,
    required this.statSymbol,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveRowColumn(
          layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          rowMainAxisAlignment: MainAxisAlignment.start,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          rowSpacing: 10.0,
          children: [
            ResponsiveRowColumnItem(
              child: SvgPicture.asset(
                iconString,
                width: 20.0,
                height: 16.0,
              ),
            ),
            ResponsiveRowColumnItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: isMobile ? 0 : 16),
                    child: Text(
                      isLoading ? 'Loading long String is loading' : titleString,
                      style: titleMedium(context),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Text(
                          isLoading ? 'small string' : statAmount,
                          style: titleLarge(context),
                        ),
                        Skeleton.ignore(
                          child: Text(
                            statSymbol,
                            style: titleMedium(context)!.copyWith(
                              color: myColors(context).altTextColor2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
