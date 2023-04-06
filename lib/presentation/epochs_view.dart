import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/block_header_bubble.dart';
import 'package:flutter_annulus/presentation/block_hover_bubble.dart';
import 'package:flutter_annulus/presentation/blocks_view.dart';
import 'package:flutter_annulus/presentation/header.dart';
import 'package:flutter_annulus/presentation/metrics_pill.dart';
import 'package:flutter_annulus/presentation/metrics_tile.dart';
import 'package:flutter_annulus/presentation/transaction_stack.dart';
import 'package:flutter_annulus/widgets/block_view.dart';
import 'package:ribn_toolkit/widgets/molecules/wave_container.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import 'notification_cards/src/model/notification_card.dart';
import 'notification_cards/src/notification_tile/notification_tile.dart';

class EpochsView extends StatefulWidget {
  @override
  State<EpochsView> createState() => _EpochsViewState();
}

class _EpochsViewState extends State<EpochsView> {
  dynamic showZoomIndex;
  String activeBlockNumber = '';
  bool isConfirmedActiveBlock = false;

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: Color(0xfff4f6f9),
      extendBodyBehindAppBar: true,
      appBar: Header(title: ''),
      body: BlockView(cardChild: [ // TODO: edit here to alter main view
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
      )
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
