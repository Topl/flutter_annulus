import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopStatWithIcon extends StatelessWidget {
  String iconString;
  String titleString;
  String statAmount;
  String statSymbol;
  bool firstItem;

  TopStatWithIcon(
      {super.key,
      required this.iconString,
      required this.titleString,
      required this.statAmount,
      required this.statSymbol,
      this.firstItem = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: firstItem ? 0 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconString,
              width: 20.0,
              height: 16.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: Text(
                titleString,
                style: const TextStyle(
                  color: Color(0xFF858E8E),
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Text(
                    statAmount,
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    statSymbol,
                    style: const TextStyle(
                      color: Color(0xFF535757),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
