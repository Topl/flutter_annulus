import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

// QQQQ move to shared
class DetailItem extends StatelessWidget {
  final String title;
  final List<Map<String, String>> value;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 195,
            child: Text(
              title,
              style: labelLarge(context),
            ),
          ),
          if (isMobile)
            const ResponsiveRowColumnItem(
              child: SizedBox(
                height: 15,
              ),
            ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: value.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _MapTextRow(
                  map: value[index],
                  valueKey: detailItemKey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MapTextRow extends StatelessWidget {
  final Map<String, String> map;
  final Key valueKey;
  const _MapTextRow({
    required this.map,
    required this.valueKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: map.entries.map((e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: SelectableText(
                  e.key,
                  style: bodyMedium(context),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SelectableText(
                  key: valueKey,
                  // Replace any text stringValue:
                  e.value.replaceAll('stringValue: ', ''),
                  style: bodyMedium(context),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
