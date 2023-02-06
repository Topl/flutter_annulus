import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import 'package:flutter_annulus/presentation/home/notification_cards/stacked_notification_cards.dart';

class TransactionStack extends StatefulWidget {
  const TransactionStack({super.key});

  @override
  State<TransactionStack> createState() => _TransactionStackState();
}

class _TransactionStackState extends State<TransactionStack> {
  final List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.block,
        size: 48,
      ),
      title: 'Block Number',
      subtitle: '#31038',
    ),
    NotificationCard(
      date: DateTime.parse('2022-01-19'),
      leading: const Icon(
        Icons.block,
        size: 48,
      ),
      title: 'Block Number',
      subtitle: '#31037',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: const Icon(
        Icons.block,
        size: 48,
      ),
      title: 'Block Number',
      subtitle: '#31036',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: const Icon(
        Icons.block,
        size: 48,
      ),
      title: 'Block Number',
      subtitle: '#31035',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 30),
      ),
      leading: const Icon(
        Icons.block,
        size: 48,
      ),
      title: 'Block Number',
      subtitle: '#31034',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 44),
      ),
      leading: const Icon(
        Icons.block,
        size: 48,
      ),
      title: 'Block Number',
      subtitle: '#31033',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 48),
      ),
      leading: const Icon(
        Icons.block,
        size: 48,
      ),
      title: 'Block Number',
      subtitle: '#31032',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StackedNotificationCards(
      boxShadow: [
        BoxShadow(
          color: const Color(0xffe2ecf9).withOpacity(0.4),
          spreadRadius: 0,
          blurRadius: 54,
          offset: const Offset(0, 9),
        ),
      ],
      notificationCardTitle: '',
      notificationCards: [..._listOfNotification],
      cardCornerRadius: 50,
      cardColor: const Color(0xffffffff),
      padding: 40,
      cardsSpacing: 15,
      actionTitle: SizedBox(),
      showLessAction: Text(
        'Show less',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      ),
      onTapClearAll: () {
        // setState(() {
        //   _listOfNotification.clear();
        // });
      },
      clearAllNotificationsAction: const SizedBox(),
      clearAllStacked: const SizedBox(),
      cardClearButton: const SizedBox(),
      cardViewButton: const SizedBox(),
      onTapClearCallback: (index) {
        // print(index);
        // setState(() {
        //   _listOfNotification.removeAt(index);
        // });
      },
      onTapViewCallback: (index) {
        // print(index);
      },
    );
  }
}
