import 'package:flutter/material.dart';

/// Block view widget
class BlockView extends StatelessWidget {
  final String blockEpoch;
  final String blockTime;
  final String blockHeight;
  final String blockHeader;

  // Constructor for BlockView widget
  const BlockView(
      {Key? key,
      required this.blockEpoch,
      required this.blockTime,
      required this.blockHeader,
      required this.blockHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
          width: 240,
          height: 344,
          margin: const EdgeInsets.only(
              left: 20.0, right: 0.0, bottom: 0.0, top: 20.0),
          padding: const EdgeInsets.all(40.0),
          decoration: BoxDecoration(
              color: const Color(0xFFFEFEFE),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                  color: const Color(0xFFE7E8E8),
                  style: BorderStyle.solid,
                  width: 1.0)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                          color: const Color(0xFFE7E8E8),
                          style: BorderStyle.solid,
                          width: 1.0)),
                  child: Image.asset(
                    'assets/icons/block-icon.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(blockHeight,
                    style: const TextStyle(
                        color: Color(0xFF282A2C),
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontFamily: 'Rational Display',
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.002)),
                const BlockSmallText(text: '12 sec ago'),
                const SizedBox(
                  height: 20,
                ),
                BlockHeaderText(text: blockEpoch),
                const BlockSmallText(text: 'Epoch'),
                const SizedBox(
                  height: 8,
                ),
                BlockHeaderText(text: blockHeader),
                const BlockSmallText(text: 'Header'),
                const SizedBox(
                  height: 8,
                ),
                BlockHeaderText(text: blockTime),
                const BlockSmallText(text: 'UTC'),
              ])
          //cardChild,
          ),
    );
  }
}

class BlockHeaderText extends StatelessWidget {
  const BlockHeaderText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: Color(0xFF282A2C),
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rational Display',
          fontStyle: FontStyle.normal,
        ));
  }
}

//
class BlockSmallText extends StatelessWidget {
  const BlockSmallText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: Color(0xFF858E8E),
          fontWeight: FontWeight.w400,
          fontSize: 12,
          fontFamily: 'Rational Display Light',
          fontStyle: FontStyle.normal,
        ));
  }
}
