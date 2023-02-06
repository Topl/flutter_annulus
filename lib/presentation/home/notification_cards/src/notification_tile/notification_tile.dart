import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

/// This widget is responsible for structuring the [NotificationCard].
class NotificationTile extends StatelessWidget {
  final int index;
  final String cardTitle;
  final AnimationController controller;
  final DateTime date;
  final String title;
  final String subtitle;
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
    required this.title,
    required this.controller,
    required this.cardTitle,
    required this.date,
    required this.subtitle,
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
      // child: Column(
      //   children: [
      //     Padding(
      //       // padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      //       padding: const EdgeInsets.symmetric(horizontal: 0.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Expanded(
      //             child: Text(
      //               cardTitle,
      //               style: kCardTopTextStyle,
      //               maxLines: 1,
      //             ),
      //           ),
      //           // Text(
      //           //   'Today ${DateFormat('h:mm a').format(date)}',
      //           //   style: kCardTopTextStyle,
      //           // )
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: 17,
      //     ),
      //     ListTile(
      //       // leading: Icon(
      //       //   Icons.account_circle,
      //       //   size: 48,
      //       // ),
      //       // title: Text(
      //       //   title,
      //       //   maxLines: 1,
      //       //   overflow: TextOverflow.ellipsis,
      //       //   style: titleTextStyle,
      //       // ),
      //       // subtitle: Text(
      //       //   subtitle,
      //       //   maxLines: 2,
      //       //   overflow: TextOverflow.ellipsis,
      //       //   style: subtitleTextStyle,
      //       // ),
      //       title: Text(
      //         title,
      //         style: TextStyle(
      //           fontSize: 14,
      //           color: const Color(0xff9197B3),
      //         ),
      //       ),
      //       subtitle: Text(
      //         subtitle,
      //         style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.bold,
      //           color: const Color(0xff161616),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index == 0 ? title : 'Transaction ID',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xff9197B3),
                ),
              ),
              Text(
                index == 0 ? subtitle : '296e...MiyY',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: index == 0 ? 24 : 18,
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
                index == 0 ? '# of transactions' : 'Timestamp',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xff9197B3),
                ),
              ),
              Text(
                index == 0 ? '6' : '2023/01/19 1:32:38 PM',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: index == 0 ? 24 : 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff161616),
                ),
              )
            ],
          ),
          index == 0
              ? Container(
                  width: 113,
                  height: 41,
                  child: ElevatedButton(
                    onPressed: () {
                      // Slidable.of(context)?.close();
                      // controller.forward();
                      controller.reverse();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.close_fullscreen,
                          color: Colors.white,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Minimise')
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
              : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: const Color(0xff161616),
                    size: 40,
                  ))
        ],
      ),
    );
  }
}
