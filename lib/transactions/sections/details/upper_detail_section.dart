import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/transactions/sections/details/detail_item.dart';
import 'package:flutter_annulus/transactions/sections/details/detail_section.dart';

class UpperDetailSection extends StatelessWidget {
  const UpperDetailSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailSection(
      items: [
        DetailItem(
          title: Strings.transactionHash,
          value: 'value',
        ),
      ],
    );
  }
}
