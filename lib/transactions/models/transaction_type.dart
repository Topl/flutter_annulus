enum TransactionType {
  transfer(
    string: 'Transfer',
  );

  const TransactionType({
    required this.string,
  });

  final String string;
}
