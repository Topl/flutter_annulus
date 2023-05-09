import 'package:flutter/material.dart';

class LowerStatWithIcon extends StatelessWidget {
  IconData icon;
  String statString;
  String statSymbol;

  LowerStatWithIcon({
    super.key,
    required this.icon,
    required this.statString,
    required this.statSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statString,
                  style: const TextStyle(
                    color: Color(0xFF282A2C),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rational Display Medium',
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
          Expanded(
            child: Icon(
              icon,
              color: const Color(0xFF858E8E),
            ),
          )
        ],
      ),
    );
  }
}
