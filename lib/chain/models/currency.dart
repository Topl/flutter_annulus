enum Currency {
  LVL,
  USD,
  EUR,
  GBP,
  ZAR,
  AUD,
}

List<String> currencies = [
  'LVL',
  'USD',
  'EUR',
  'GBP',
  'ZAR',
  'AUD',
];

Currency convertStringToCurrency({required String currencyString}) {
  return Currency.values.firstWhere((e) => e.toString() == 'Currency.$currencyString');
}
