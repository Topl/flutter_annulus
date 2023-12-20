import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

// QQQQ move to shared
class DetailItem extends StatelessWidget {
  final String title;
  final String value;
  final bool canCopy;
  final Key detailItemKey;
  const DetailItem({
    required this.title,
    required this.value,
    this.canCopy = false,
    required this.detailItemKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    // TODO: Remove the Container and padding. This paddingg should be defined by parent
    return Container(
      padding: EdgeInsets.only(left: isMobile ? 20 : 60),
      child: ResponsiveRowColumn(
        layout: isMobile ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnMainAxisAlignment: MainAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(
            child: SizedBox(
              width: 195,
              child: Text(
                title,
                style: labelLarge(context),
              ),
            ),
          ),
          if (isMobile)
            const ResponsiveRowColumnItem(
              child: SizedBox(
                height: 15,
              ),
            ),
          ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SelectableText(
                    value,
                    style: bodyMedium(context),
                    key: detailItemKey,
                  ),
                ),
                if (canCopy)
                  IconButton(
                    onPressed: () {
                      // TODO Implement Copy
                    },
                    icon: const Icon(Icons.copy),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
