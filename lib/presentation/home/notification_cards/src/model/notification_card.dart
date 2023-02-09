class NotificationCard {
  final DateTime date;
  final String cardType;
  final Map cardData;
  final List transactions;

  const NotificationCard({
    required this.date,
    required this.cardType,
    required this.cardData,
    this.transactions = const [],
  });
}
