enum TransactionStatus {
  pending(
    string: 'Pending',
  ),
  confirmed(
    string: 'Confirmed',
  ),
  failed(
    string: 'Failed',
  );

  const TransactionStatus({
    required this.string,
  });

  final String string;
}
