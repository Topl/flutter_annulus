import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/stat_info_card.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';

class SubSection extends StatelessWidget {
  final StatInfoCard statInfoCard1;
  final StatInfoCard statInfoCard2;
  final ThemeMode colorTheme;
  const SubSection({
    required this.statInfoCard1,
    required this.statInfoCard2,
    required this.colorTheme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        statInfoCard1,
        SizedBox(
          height: 50,
          child: VerticalDivider(
            thickness: 1,
            color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
          ),
        ),
        statInfoCard2,
      ],
    );
  }
}
