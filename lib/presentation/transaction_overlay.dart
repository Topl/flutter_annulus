import 'dart:ui';

import 'package:flutter/material.dart';

import 'notification_cards/src/notification_tile/notification_tile.dart';

displayDialog(BuildContext context) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: Duration(milliseconds: 300),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Material(
        color: Colors.transparent,
        child: SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 49,
                          height: 49,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffffffff).withOpacity(0.5),
                                spreadRadius: 10,
                                blurRadius: 54,
                                offset: const Offset(0, 9),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 680,
                    child: NotificationTile(
                      leadingCardOnClickButtonAction: () {},
                      onCardClick: () => displayDialog(context),
                      onCardIconClick: () => displayDialog(context),
                      date: DateTime.parse('2023-02-08T13:19:01.228Z'),
                      cardBody: {
                        'id': 'NLHoRBxchwF0B3N5xRbz3h0u',
                        'timestamp': '2023-02-08T20:31:23.228Z',
                        'amount': 100,
                        'blockNumber': '31036',
                        'senderId': 'b9olUVDG9mv2VqrZzJDg50FN',
                      },
                      cardType: 'utxo',
                      height: 140,
                      color: const Color(0xffffffff),
                      cornerRadius: 50,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffe2ecf9).withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 9),
                        ),
                      ],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 92,
                    child: VerticalDivider(
                      width: 20,
                      thickness: 4,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xffEEEEEE),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 11,
                    decoration: const BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 620,
                    child: NotificationTile(
                      leadingCardOnClickButtonAction: () {},
                      onCardClick: () {},
                      onCardIconClick: () {},
                      date: DateTime.parse('2023-02-08T13:19:01.228Z'),
                      cardBody: {
                        'id': '9MPsAfYvebN1JLF3Qz0mcJyA',
                        'timestamp': '2023-02-08T20:33:02.228Z',
                        'amount': 100,
                        'blockNumber': '31036',
                        'senderId': 'b9olUVDG9mv2VqrZzJDg50FN',
                      },
                      cardType: 'transaction',
                      height: 140,
                      color: const Color(0xffffffff),
                      cornerRadius: 50,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffe2ecf9).withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 9),
                        ),
                      ],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      trailingIcon: Icons.more_horiz,
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 11,
                    decoration: const BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 92,
                    child: VerticalDivider(
                      width: 20,
                      thickness: 4,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xffEEEEEE),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            color: const Color(0xffEEEEEE),
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 92,
                                  width: 4,
                                  child: VerticalDivider(
                                    width: 20,
                                    thickness: 4,
                                    indent: 10,
                                    endIndent: 0,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -8,
                            child: Container(
                              width: 20,
                              height: 11,
                              decoration: const BoxDecoration(
                                color: Color(0xffEEEEEE),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 92,
                            child: SizedBox(
                              width: 680,
                              child: NotificationTile(
                                leadingCardOnClickButtonAction: () {},
                                onCardClick: () => displayDialog(context),
                                onCardIconClick: () => displayDialog(context),
                                date: DateTime.parse('2023-02-08T13:19:01.228Z'),
                                cardBody: {
                                  'id': 'Dlu63xc1D9foKmUm2iuhGqNP',
                                  'timestamp': '2023-02-08T20:34:41.228Z',
                                  'amount': 20,
                                  'blockNumber': '31036',
                                  'senderId': 'b9olUVDG9mv2VqrZzJDg50FN',
                                },
                                cardType: 'utxo',
                                height: 140,
                                color: const Color(0xffffffff),
                                cornerRadius: 50,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffe2ecf9).withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 20,
                                    offset: const Offset(0, 9),
                                  ),
                                ],
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 728,
                        height: 4,
                        child: Divider(
                          thickness: 4,
                          indent: 0,
                          endIndent: 0,
                          color: Color(0xffEEEEEE),
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            color: const Color(0xffEEEEEE),
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 92,
                                  width: 4,
                                  child: VerticalDivider(
                                    width: 20,
                                    thickness: 4,
                                    indent: 10,
                                    endIndent: 0,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -8,
                            child: Container(
                              width: 20,
                              height: 11,
                              decoration: const BoxDecoration(
                                color: Color(0xffEEEEEE),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 92,
                            child: SizedBox(
                              width: 680,
                              child: NotificationTile(
                                leadingCardOnClickButtonAction: () {},
                                onCardClick: () => displayDialog(context),
                                onCardIconClick: () => displayDialog(context),
                                date: DateTime.parse('2023-02-08T13:19:01.228Z'),
                                cardBody: {
                                  'id': 'jFjj7qTG8HCry6y6zOaYU9Py',
                                  'timestamp': '2023-02-08T20:35:09.228Z',
                                  'amount': 80,
                                  'blockNumber': '31036',
                                  'senderId': 'b9olUVDG9mv2VqrZzJDg50FN',
                                },
                                cardType: 'utxo',
                                height: 140,
                                color: const Color(0xffffffff),
                                cornerRadius: 50,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffe2ecf9).withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 20,
                                    offset: const Offset(0, 9),
                                  ),
                                ],
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
