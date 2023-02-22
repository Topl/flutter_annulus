import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/header.dart';
import 'package:flutter_annulus/presentation/metrics_pill.dart';
import 'package:flutter_annulus/presentation/transaction_stack.dart';
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

  @override
  Widget build(BuildContext context) {
    final List<NotificationCard> mockBlockData = [
      NotificationCard(
        date: DateTime.parse('2023-02-08T13:19:01.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'dPl0x8WwUth12oqRzvbq4yt7',
          'timestamp': '2023-02-08T13:19:01.228Z',
          'blockStatus': 'pending',
          'blockNumber': '31038',
          'numberOfTransactions': 2,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-09T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-09T19:22:02.228Z',
          'blockNumber': '31037',
          'blockStatus': 'pending',
          'numberOfTransactions': 5,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-10T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-10T19:22:02.228Z',
          'blockNumber': '31036',
          'blockStatus': 'pending',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-11T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-11T19:22:02.228Z',
          'blockNumber': '31035',
          'blockStatus': 'pending',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-12T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-12T19:22:02.228Z',
          'blockNumber': '31034',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-13T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-13T19:22:02.228Z',
          'blockNumber': '31033',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-14T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-14T19:22:02.228Z',
          'blockNumber': '31032',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-15T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-15T19:22:02.228Z',
          'blockNumber': '31031',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-16T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-16T19:22:02.228Z',
          'blockNumber': '31030',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-17T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-17T19:22:02.228Z',
          'blockNumber': '31029',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-17T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-17T19:22:02.228Z',
          'blockNumber': '31028',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-18T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-18T19:22:02.228Z',
          'blockNumber': '31027',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-19T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-19T19:22:02.228Z',
          'blockNumber': '31026',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-20T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-20T19:22:02.228Z',
          'blockNumber': '31025',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-21T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-21T19:22:02.228Z',
          'blockNumber': '31024',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-22T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-22T19:22:02.228Z',
          'blockNumber': '31023',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      // Next Group
      NotificationCard(
        date: DateTime.parse('2023-02-08T13:19:01.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'dPl0x8WwUth12oqRzvbq4yt7',
          'timestamp': '2023-02-08T13:19:01.228Z',
          'blockStatus': 'confirmed',
          'blockNumber': '31022',
          'numberOfTransactions': 2,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-09T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-09T19:22:02.228Z',
          'blockNumber': '31021',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 5,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-10T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-10T19:22:02.228Z',
          'blockNumber': '31020',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-11T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-11T19:22:02.228Z',
          'blockNumber': '31019',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-12T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-12T19:22:02.228Z',
          'blockNumber': '31018',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-13T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-13T19:22:02.228Z',
          'blockNumber': '31017',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-14T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-14T19:22:02.228Z',
          'blockNumber': '31016',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-15T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-15T19:22:02.228Z',
          'blockNumber': '31015',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-16T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-16T19:22:02.228Z',
          'blockNumber': '31014',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-17T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-17T19:22:02.228Z',
          'blockNumber': '31013',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-17T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-17T19:22:02.228Z',
          'blockNumber': '31012',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-18T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-18T19:22:02.228Z',
          'blockNumber': '31011',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-19T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-19T19:22:02.228Z',
          'blockNumber': '31010',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-20T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-20T19:22:02.228Z',
          'blockNumber': '31009',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-21T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-21T19:22:02.228Z',
          'blockNumber': '31008',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-22T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-22T19:22:02.228Z',
          'blockNumber': '31007',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      // Next Group
      NotificationCard(
        date: DateTime.parse('2023-02-23T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'dPl0x8WwUth12oqRzvbq4yt7',
          'timestamp': '2023-02-23T13:19:01.228Z',
          'blockStatus': 'confirmed',
          'blockNumber': '31006',
          'numberOfTransactions': 2,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-24T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-24T19:22:02.228Z',
          'blockNumber': '31005',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 5,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-25T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-25T19:22:02.228Z',
          'blockNumber': '31004',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-26T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-26T19:22:02.228Z',
          'blockNumber': '31003',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-27T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-27T19:22:02.228Z',
          'blockNumber': '31002',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-28T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-28T19:22:02.228Z',
          'blockNumber': '31001',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-01T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-01T19:22:02.228Z',
          'blockNumber': '31000',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-02T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-02T19:22:02.228Z',
          'blockNumber': '30998',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-04T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-04T19:22:02.228Z',
          'blockNumber': '30997',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-05T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-05T19:22:02.228Z',
          'blockNumber': '30996',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-06T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-06T19:22:02.228Z',
          'blockNumber': '30995',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-07T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-07T19:22:02.228Z',
          'blockNumber': '30994',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-07T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-07T19:22:02.228Z',
          'blockNumber': '30993',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-08T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-08T19:22:02.228Z',
          'blockNumber': '30992',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-09T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-09T19:22:02.228Z',
          'blockNumber': '30991',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
      NotificationCard(
        date: DateTime.parse('2023-03-10T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-03-10T19:22:02.228Z',
          'blockNumber': '30990',
          'blockStatus': 'confirmed',
          'numberOfTransactions': 3,
        },
        transactions: <NotificationCard>[],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff4f6f9),
      extendBodyBehindAppBar: true,
      appBar: const Header(title: 'Event Explorer'),
      body: WaveContainer(
        containerHeight: MediaQuery.of(context).size.height,
        containerWidth: MediaQuery.of(context).size.width,
        waveAmplitude: 30,
        containerChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  SizedBox(
                    width: 260,
                    height: 130,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: false,
                      ),
                      child: GridView.extent(
                        clipBehavior: Clip.none,
                        physics: NeverScrollableScrollPhysics(),
                        maxCrossAxisExtent: 60,
                        padding: const EdgeInsets.all(0),
                        childAspectRatio: 2.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: _buildList(blockData: mockBlockData, offsetValue: 0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 260,
                    height: 130,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: false,
                      ),
                      child: GridView.extent(
                        clipBehavior: Clip.none,
                        physics: NeverScrollableScrollPhysics(),
                        maxCrossAxisExtent: 60,
                        padding: const EdgeInsets.all(0),
                        childAspectRatio: 2.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: _buildList(blockData: mockBlockData, offsetValue: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 260,
                    height: 130,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: false,
                      ),
                      child: GridView.extent(
                        clipBehavior: Clip.none,
                        physics: NeverScrollableScrollPhysics(),
                        maxCrossAxisExtent: 60,
                        padding: const EdgeInsets.all(0),
                        childAspectRatio: 2.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: _buildList(blockData: mockBlockData, offsetValue: 32),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildList({required List<NotificationCard> blockData, required int offsetValue}) {
    return List.generate(
      offsetValue == 0 ? blockData.length : blockData.skip(offsetValue).length,
      (index) {
        final isConfirmedBlock = blockData[index + offsetValue].cardData['blockStatus'] == 'confirmed';

        return Transform.scale(
          scale: showZoomIndex == index + offsetValue && isConfirmedBlock ? 1.3 : 1,
          child: MouseRegion(
            onEnter: (event) {
              setState(() {
                showZoomIndex = index + offsetValue;
              });
            },
            onExit: (event) {
              setState(() {
                showZoomIndex = null;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isConfirmedBlock ? const Color(0xffffffff) : const Color(0xff218e8a),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: isConfirmedBlock ? const Color(0xffeeeeee) : const Color(0xff1d6562),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffe2ecf9).withOpacity(.4),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: isConfirmedBlock
                  ? Text(
                      '#${blockData[index + offsetValue].cardData['blockNumber']}',
                      style: const TextStyle(
                        color: Color(0xff9197B3),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        );
      },
    );
  }
}
