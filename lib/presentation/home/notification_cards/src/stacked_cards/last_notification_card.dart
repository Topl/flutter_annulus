import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../model/notification_card.dart';

/// [LastNotificationCard] is the topmost card on the stack

class LastNotificationCard extends StatelessWidget {
  final AnimationController controller;
  final NotificationCard notification;
  final int totalCount;
  final double cornerRadius;
  final Color color;
  final double height;
  final String notificationCardTitle;
  final TextStyle titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final List<BoxShadow>? boxShadow;
  final double padding;

  const LastNotificationCard({
    Key? key,
    required this.controller,
    required this.notification,
    required this.totalCount,
    required this.color,
    required this.cornerRadius,
    required this.height,
    required this.notificationCardTitle,
    required this.subtitleTextStyle,
    required this.titleTextStyle,
    required this.boxShadow,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: totalCount > 1 && controller.value <= 0.4,
      child: GestureDetector(
        key: ValueKey('onTapExpand'),
        onTap: () {
          // Slidable.of(context)?.close();
          // controller.forward();
        },
        child: Container(
          key: ValueKey('LastNotificationCard'),
          margin: EdgeInsets.symmetric(horizontal: padding),
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(cornerRadius),
            boxShadow: boxShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xff9197B3),
                    ),
                  ),
                  Text(
                    notification.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
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
                  Text(
                    '# of transactions',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xff9197B3),
                    ),
                  ),
                  Text(
                    '6',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff161616),
                    ),
                  )
                ],
              ),
              Container(
                width: 109,
                height: 41,
                child: ElevatedButton(
                  onPressed: () {
                    Slidable.of(context)?.close();
                    controller.forward();
                  },
                  child: Row(
                    children: [
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff48918a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Color(0xff197D7A), width: 0.5),
                    ),
                  ),
                ),
              )
            ],
          ),
          // child: Stack(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(top: 0.0),
          //       child: Container(
          //         color: Colors.red,
          //         width: 471,
          //         height: 140,
          //       ),
          //     )
          //     // ListTile(
          //     //   // isThreeLine: true,
          //     //   // leading: Icon(
          //     //   //   Icons.account_circle,
          //     //   //   size: 48,
          //     //   // ),
          //     //   // title: Text(
          //     //   //   notification.title,
          //     //   //   maxLines: 1,
          //     //   //   overflow: TextOverflow.ellipsis,
          //     //   //   style: titleTextStyle,
          //     //   // ),
          //     //   // subtitle: Text(
          //     //   //   notification.subtitle,
          //     //   //   maxLines: 2,
          //     //   //   overflow: TextOverflow.ellipsis,
          //     //   //   style: subtitleTextStyle,
          //     //   // ),
          //     //   title: Text(
          //     //     notification.title,
          //     //     style: TextStyle(
          //     //       fontSize: 14,
          //     //       color: const Color(0xff9197B3),
          //     //     ),
          //     //   ),
          //     //   subtitle: Text(
          //     //     notification.subtitle,
          //     //     style: TextStyle(
          //     //       fontSize: 24,
          //     //       fontWeight: FontWeight.bold,
          //     //       color: const Color(0xff161616),
          //     //     ),
          //     //   ),
          //     // ),
          //     // Positioned(
          //     //   top: 16,
          //     //   left: 16,
          //     //   right: 16,
          //     //   child: Opacity(
          //     //     opacity: Tween(begin: 0.0, end: 1.0)
          //     //         .animate(
          //     //           CurvedAnimation(
          //     //             parent: controller,
          //     //             curve: Interval(0.2, 0.3),
          //     //           ),
          //     //         )
          //     //         .value,
          //     //     child: Row(
          //     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //       children: [
          //     //         Expanded(
          //     //           child: Text(
          //     //             notificationCardTitle,
          //     //             style: kCardTopTextStyle,
          //     //             maxLines: 1,
          //     //           ),
          //     //         ),
          //     //         Text(
          //     //           'Today ${DateFormat('h:mm a').format(notification.date)}',
          //     //           style: kCardTopTextStyle,
          //     //         )
          //     //       ],
          //     //     ),
          //     //   ),
          //     // ),
          //     // ehere
          //     // Transform.translate(
          //     //   offset: Tween<Offset>(
          //     //     // begin: Offset(0, 15),
          //     //     // end: Offset(0, 10),
          //     //     begin: Offset(0, 40),
          //     //     end: Offset(0, 40),
          //     //   )
          //     //       .animate(
          //     //         CurvedAnimation(
          //     //           parent: controller,
          //     //           curve: Interval(0.0, 0.2),
          //     //         ),
          //     //       )
          //     //       .value,
          //     //   child: Visibility(
          //     //     visible: controller.value <= 0.2,
          //     //     child: ListTile(
          //     //       // leading: Icon(
          //     //       //   Icons.account_circle,
          //     //       //   size: 48,
          //     //       // ),
          //     //       // title: Text(
          //     //       //   notification.title,
          //     //       //   maxLines: 1,
          //     //       //   overflow: TextOverflow.ellipsis,
          //     //       //   style: titleTextStyle,
          //     //       // ),
          //     //       // subtitle: Text(
          //     //       //   notification.subtitle,
          //     //       //   maxLines: 2,
          //     //       //   overflow: TextOverflow.ellipsis,
          //     //       //   style: subtitleTextStyle,
          //     //       // ),
          //     //       title: Text(
          //     //         notification.title,
          //     //         style: TextStyle(
          //     //           fontSize: 14,
          //     //           color: const Color(0xff9197B3),
          //     //         ),
          //     //       ),
          //     //       subtitle: Text(
          //     //         notification.subtitle,
          //     //         style: TextStyle(
          //     //           fontSize: 24,
          //     //           fontWeight: FontWeight.bold,
          //     //           color: const Color(0xff161616),
          //     //         ),
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //     // Transform.translate(
          //     //   offset: Tween<Offset>(
          //     //     begin: Offset(0, 10),
          //     //     end: Offset(0, 50),
          //     //   )
          //     //       .animate(
          //     //         CurvedAnimation(
          //     //           parent: controller,
          //     //           curve: Interval(0.2, 0.4),
          //     //         ),
          //     //       )
          //     //       .value,
          //     //   child: Visibility(
          //     //     visible: controller.value >= 0.2,
          //     //     child: ListTile(
          //     //       // leading: Icon(
          //     //       //   Icons.account_circle,
          //     //       //   size: 48,
          //     //       // ),
          //     //       title: Text(
          //     //         notification.title,
          //     //         maxLines: 1,
          //     //         overflow: TextOverflow.ellipsis,
          //     //         style: titleTextStyle,
          //     //       ),
          //     //       subtitle: Text(
          //     //         notification.subtitle,
          //     //         maxLines: 2,
          //     //         overflow: TextOverflow.ellipsis,
          //     //         style: subtitleTextStyle,
          //     //       ),
          //     //       // trailing: ElevatedButton(
          //     //       //   onPressed: () {},
          //     //       //   child: Text('here'),
          //     //       // ),
          //     //     ),
          //     //   ),
          //     // ),
          //     // Positioned(
          //     //   bottom: 16,
          //     //   child: Opacity(
          //     //     opacity: Tween(begin: 1.0, end: 0.0)
          //     //         .animate(
          //     //           CurvedAnimation(
          //     //             parent: controller,
          //     //             curve: Interval(0.0, 0.2),
          //     //           ),
          //     //         )
          //     //         .value,
          //     //     child: Padding(
          //     //       padding: const EdgeInsets.symmetric(
          //     //         horizontal: 16.0,
          //     //         vertical: 4.0,
          //     //       ),
          //     //       child: Text(
          //     //         '${totalCount - 1} more notification',
          //     //         style: TextStyle(fontSize: 16),
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
