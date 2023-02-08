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
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff9197B3),
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
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff9197B3),
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
<<<<<<< Updated upstream
              ? AnimatedOpacity(
                  opacity: controller.value >= 1 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 150),
                  child: SizedBox(
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
=======
              ? Opacity(
                  opacity: Tween(begin: 0.0, end: 1.0)
                      .animate(
                        CurvedAnimation(
                          parent: controller,
                          curve: Interval(0.2, 0.3),
                        ),
                      )
                      .value,
                  child: Container(
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff48918a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Color(0xff197D7A), width: 0.5),
                        ),
>>>>>>> Stashed changes
                      ),
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xff161616),
                    size: 40,
                  ),
                )
        ],
      ),
    );
  }
}
