import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    // print current size of the widget
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconString,
          width: 20.0,
          height: 16.0,
        ),
        const SizedBox(height: 16.0),
        Text(
          isLoading ? 'Loading long String is loading' : titleString,
          style: titleMedium(context),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: titleLarge(context),
                  children: <TextSpan>[
                    TextSpan(
                      text: isLoading ? 'small string' : statAmount,
                    ),
                    TextSpan(
                      text: isLoading ? '' : statSymbol,
                      style: titleMedium(context)!.copyWith(
                        color: myColors(context).altTextColor2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
