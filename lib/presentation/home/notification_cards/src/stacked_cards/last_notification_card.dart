import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../model/notification_card.dart';

/// [LastNotificationCard] is the topmost card on the stack

class LastNotificationCard extends StatelessWidget {
  final AnimationController controller;
  final NotificationCard cardBody;
  final int totalCount;
  final double cornerRadius;
  final Color color;
  final double height;
  final TextStyle titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final List<BoxShadow>? boxShadow;
  final double padding;

  const LastNotificationCard({
    Key? key,
    required this.controller,
    required this.cardBody,
    required this.totalCount,
    required this.color,
    required this.cornerRadius,
    required this.height,
    required this.subtitleTextStyle,
    required this.titleTextStyle,
    required this.boxShadow,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: totalCount > 1 && controller.value <= 0.4,
      child: Container(
        key: const ValueKey('LastNotificationCard'),
        margin: EdgeInsets.symmetric(horizontal: padding),
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(cornerRadius),
          boxShadow: boxShadow,
        ),
        child: renderCardBody(context),
      ),
    );
  }

  renderCardBody(context) {
    if (cardBody.cardType == 'block') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Block #',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff9197B3),
                ),
              ),
              Text(
                cardBody.cardData['blockNumber'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff161616),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '# of transactions',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff9197B3),
                ),
              ),
              Text(
                '${cardBody.cardData['numberOfTransactions']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff161616),
                ),
              )
            ],
          ),
          AnimatedOpacity(
            opacity: controller.value < 0.3 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 150),
            child: SizedBox(
              width: 109,
              height: 41,
              child: ElevatedButton(
                onPressed: () {
                  Slidable.of(context)?.close();
                  controller.forward();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff48918a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Color(0xff197D7A), width: 0.5),
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.open_in_full,
                      color: Colors.white,
                      size: 16.0,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Expand')
                  ],
                ),
              ),
            ),
          )
        ],
      );
    } else {
      return Text('transaction');
    }
  }
}
