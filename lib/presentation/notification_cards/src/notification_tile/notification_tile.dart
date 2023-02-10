import 'package:flutter/material.dart';
import 'package:flutter_annulus/utils.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../model/notification_card.dart';

/// This widget is responsible for structuring the [NotificationCard].
class NotificationTile extends StatelessWidget {
  final int index;
  final Map<dynamic, dynamic> cardBody;
  final String cardType;
  final AnimationController controller;
  final DateTime date;
  final EdgeInsets? padding;
  final double height;
  final double spacing;
  final double cornerRadius;
  final Color color;
  final TextStyle titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final List<BoxShadow>? boxShadow;

  const NotificationTile({
    Key? key,
    required this.index,
    required this.cardBody,
    required this.cardType,
    required this.controller,
    required this.date,
    required this.height,
    required this.cornerRadius,
    required this.color,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.boxShadow,
    this.spacing = 0,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(cornerRadius),
        boxShadow: boxShadow,
      ),
      child: renderCardBody(context),
    );
  }

  renderCardBody(context) {
    final dateTime = DateTime.parse(cardBody['timestamp']);

    final formattedDateTime = DateFormat('yyyy/MM/dd HH:mm:ss a').format(dateTime);

    if (cardType == 'block') {
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
                cardBody['blockNumber'],
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
                '${cardBody['numberOfTransactions']}',
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
          SizedBox(
            width: 113,
            height: 41,
            child: ElevatedButton(
              onPressed: () {
                controller.reverse();
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
                    Icons.close_fullscreen,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text('Minimize')
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Transaction ID',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff9197B3),
                ),
              ),
              Text(
                formatAddrString(cardBody['id']),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff161616),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Timestamp',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff9197B3),
                ),
              ),
              Text(
                formattedDateTime,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff161616),
                ),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xff161616),
              size: 40,
            ),
          )
        ],
      );
    }
  }
}
