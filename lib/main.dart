import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/header.dart';
import 'package:flutter_annulus/presentation/layout.dart';

import 'widgets/block_view.dart';

void main() {
  runApp(const AnnulusApp());
}

class AnnulusApp extends StatelessWidget {
  const AnnulusApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      home: CustomLayout(
        header: Header(
          logoAsset: 'images/logo.svg',
          onSearch: () {},
          dropdownItems: [],
          onDropdownChanged: (String value) {},
        ),
        content: Container(
          alignment: Alignment.center,
          child: const BlockView(cardChild: [ // TODO: edit here to alter main view
            SizedBox(
              height: 16,
            ),
            Text("242218", style: TextStyle(
                color: Color(0xFF282A2C),
                fontWeight: FontWeight.w600,
                fontSize: 24,
                fontFamily: 'Rational Display',
                fontStyle: FontStyle.normal,
                letterSpacing: -0.002
            )),
            BlockSmallText(text: '12 sec ago'),
            SizedBox(
              height: 16,
            ),
            BlockHeaderText(text: 'EP100'),
            BlockSmallText(text: 'Epoch'),
            SizedBox(
              height: 16,
            ),
            BlockHeaderText(text: 'h1000'),
            BlockSmallText(text: 'Header'),
            SizedBox(
              height: 16,
            ),
            BlockHeaderText(text: '16:32:02'),
            BlockSmallText(text: 'UTC'),
          ]
          ),
        ),
        footer: Container(
          height: 100,
          alignment: Alignment.center,
          child: Text("footer"),
        ),
      ),
    );
  }
}

class BlockHeaderText extends StatelessWidget {
  const BlockHeaderText({
    super.key,
    required this.text
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(
      color: Color(0xFF282A2C),
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontFamily: 'Rational Display',
      fontStyle: FontStyle.normal,
    )
    );
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
    return Text(text, style: const TextStyle(
      color: Color(0xFF858E8E),
      fontWeight: FontWeight.w400,
      fontSize:  12,
      fontFamily: 'Rational Display',
      fontStyle: FontStyle.normal,
    )
    );
  }
}