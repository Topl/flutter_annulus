import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/sections/details/detail_item.dart';

class DetailSection extends StatelessWidget {
  final List<DetailItem> items;
  const DetailSection({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: items,
      ),
    );
  }
}
