import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String value;
  final bool canCopy;
  const DetailItem({
    required this.title,
    required this.value,
    this.canCopy = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      children: [
        ResponsiveRowColumnItem(
          child: Text(title),
        ),
        ResponsiveRowColumnItem(
          child: Row(
            children: [
              Text(value),
              if (canCopy)
                IconButton(
                  onPressed: () {
                    print('QQQQ copy');
                  },
                  icon: const Icon(Icons.copy),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
