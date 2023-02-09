import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/home/metrics_pill.dart';
import 'package:flutter_annulus/presentation/home/transaction_stack.dart';
import 'package:ribn_toolkit/widgets/molecules/wave_container.dart';

import 'notification_cards/src/model/notification_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<NotificationCard> mockBlockData = [
      NotificationCard(
        date: DateTime.parse('2023-02-08T13:19:01.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'dPl0x8WwUth12oqRzvbq4yt7',
          'timestamp': '2023-02-08T13:19:01.228Z',
          'blockNumber': '31038',
          'numberOfTransactions': 2,
        },
        transactions: <NotificationCard>[
          NotificationCard(
            date: DateTime.parse('2023-02-08T12:01:19.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': '23Q1cZg3LKNsBSSKsYWXpJDm',
              'timestamp': '2023-02-08T12:01:19.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 4324000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2023-02-08T09:19:01.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'U8j5s8QToYuF2hnUn4A3d5AY',
              'timestamp': '2023-02-08T13:19:01.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 8992000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
        ],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-09T19:22:02.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'g3ZuUohwyiO6B8yWfF2LPHIK',
          'timestamp': '2023-02-09T19:22:02.228Z',
          'blockNumber': '31037',
          'numberOfTransactions': 5,
        },
        transactions: <NotificationCard>[
          NotificationCard(
            date: DateTime.parse('2021-06-01T07:44:31.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'FfaEjiCtTknU17aTIO5Kq0wc',
              'timestamp': '2021-06-01T07:44:31.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 2891000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2021-06-01T08:38:03.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': '3ZF3zTMvuQ7IwHx12kH1UKz0',
              'timestamp': '2021-06-01T08:38:03.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 3007000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2021-06-01T10:20:03.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'J7cZn8ToRGWv72GKDZfR4Wd7',
              'timestamp': '2021-06-01T10:20:03.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 2891000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2021-06-01T11:00:69.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'lr4d19IgG8TmwqifEvIiyIu0',
              'timestamp': '2021-06-01T11:00:69.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 3007000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2021-06-01T12:00:69.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'HBGyvcX99yKC7o99F7p55m3O',
              'timestamp': '2021-06-01T12:00:69.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 3007000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
        ],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-08T22:00:01.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'XF9zw14YZDGgzb9cPwlc3OKT',
          'timestamp': '2023-02-08T22:00:01.228Z',
          'blockNumber': '31036',
          'numberOfTransactions': 6,
        },
        transactions: <NotificationCard>[
          NotificationCard(
            date: DateTime.parse('2023-02-08T16:00:01.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': '4k4147QDn5O83LeoPp9R3wVD',
              'timestamp': '2023-02-08T16:00:01.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 4324000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2023-02-08T17:01:01.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'yw0818Vb38nAV1618jP2dJGo',
              'timestamp': '2023-02-08T17:01:01.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 8992000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2023-02-08T18:01:01.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': '3ETug8Zmhjt4Zle05eq9sud5',
              'timestamp': '2023-02-08T18:01:01.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 8992000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2023-02-08T19:01:01.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'Ff3x520ml8UL11v007vePj4y',
              'timestamp': '2023-02-08T19:01:01.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 8992000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2023-02-08T20:01:01.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': '3LlpEsg9P333v1gavU1ej9RG',
              'timestamp': '2023-02-08T20:01:01.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 8992000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2023-02-08T21:01:01.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'dPl0x8WwUth12oqRzvbq4yt7',
              'timestamp': '2023-02-08T21:01:01.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 8992000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
        ],
      ),
      NotificationCard(
        date: DateTime.parse('2023-02-08T23:19:01.228Z'),
        cardType: 'block',
        cardData: {
          'id': 'dPl0x8WwUth12oqRzvbq4yt7',
          'timestamp': '2023-02-08T23:19:01.228Z',
          'blockNumber': '31035',
          'numberOfTransactions': 2,
        },
        transactions: <NotificationCard>[
          NotificationCard(
            date: DateTime.parse('2023-02-08T20:42:11.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': '23Q1cZg3LKNsBSSKsYWXpJDm',
              'timestamp': '2023-02-08T20:42:11.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 4324000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
          NotificationCard(
            date: DateTime.parse('2023-02-08T19:00:11.228Z'),
            cardType: 'transaction',
            cardData: {
              'id': 'U8j5s8QToYuF2hnUn4A3d5AY',
              'timestamp': '2023-02-08T19:00:11.228Z',
              'to': [
                ["W1qW25LzNkdB4HVj9Xv21hpt2vHeXM1yp6fqiH7eu2j", 8992000]
              ],
              'from': [
                ["GK1cH3jVCLN6R4aWoK5fLXSuTqnsCQNHvzbECJTKe4h9", null]
              ],
            },
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff4f6f9),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            Image.asset(
              'assets/icons/leaves-logo.png',
              width: 45,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              widget.title,
              style: const TextStyle(color: Color(0xff165867)),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: const Color(0xfff4f6f9).withOpacity(1),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              WaveContainer(
                containerHeight: MediaQuery.of(context).size.height * .5,
                containerWidth: MediaQuery.of(context).size.width,
                waveAmplitude: 30,
                containerChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      MetricsPill(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListView(
            padding: const EdgeInsets.only(top: 86),
            scrollDirection: Axis.horizontal,
            children: [
              ...mockBlockData.map(
                (card) {
                  return TransactionStack(
                    card: card,
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
