import 'package:flutter/material.dart';

class LowerStatWithoutIcon extends StatelessWidget {
  String statValue;
  String statSymbol;
  bool firstItem;

  LowerStatWithoutIcon(
      {super.key,
      required this.statValue,
      required this.statSymbol,
      this.firstItem = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: firstItem ? 0 : 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              statValue,
              style: const TextStyle(
                color: Color(0xFF282A2C),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rational Display',
              ),
            ),
            Text(
              statSymbol,
              style: const TextStyle(
                color: Color(0xFF858E8E),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rational Display',
              ),
            )
          ],
        ),
      ),
    );
  }
}
