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
          'blockNumber': '31036',
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
          'blockNumber': '31035',
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
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  SizedBox(
                    width: 260,
                    height: 130,
                    child: GridView.count(
                      padding: const EdgeInsets.all(0),
                      crossAxisCount: 4,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        mockBlockData.length,
                        (index) {
                          final isConfirmedBlock = mockBlockData[index].cardData['blockStatus'] == 'confirmed';

                          return Container(
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
                                  color: const Color(0xffe2ecf9).withOpacity(0.4),
                                  spreadRadius: 0,
                                  blurRadius: 54,
                                  offset: const Offset(0, 9),
                                ),
                              ],
                            ),
                            child: isConfirmedBlock
                                ? Text(
                                    '#${mockBlockData[index].cardData['blockNumber']}',
                                    style: const TextStyle(
                                      color: Color(0xff9197B3),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const SizedBox(),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
