import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import 'package:flutter_annulus/presentation/home/notification_cards/stacked_notification_cards.dart';

class TransactionStack extends StatefulWidget {
  final NotificationCard card;

  const TransactionStack({required this.card, super.key});

  @override
  State<TransactionStack> createState() => _TransactionStackState();
}

class _TransactionStackState extends State<TransactionStack> {
  @override
  Widget build(BuildContext context) {
    // This widget needs to map over n number of notification cards from an array
    // And render a size box with stacked notification cards n number of times

    // final List listOfTransactions = [...widget.card.transactions];
    // List.from(widget.card.transactions).add(1);
    final List<NotificationCard> listOfTransactions = widget.card.transactions as List<NotificationCard>
      ..add(widget.card);

    // final List listOfTransactions = widget.card.transactions + [widget.card];

    // print(listOfTransactions);

    return SizedBox(
      width: 550,
      child: Center(
        child: SingleChildScrollView(
          child: StackedNotificationCards(
            boxShadow: [
              BoxShadow(
                color: const Color(0xffe2ecf9).withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 40,
                offset: const Offset(0, 9),
              ),
            ],
            notificationCardTitle: '',
            // notificationCards: [..._listOfNotification],
            notificationCards: listOfTransactions,
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
          ),
        ),
      ),
    );
  }
}
