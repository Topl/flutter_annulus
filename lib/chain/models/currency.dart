enum Currency {
  lvl(type: 'LVL'),
  usd(type: 'USD'),
  eur(type: 'EUR'),
  gbp(type: 'GBP'),
  zar(type: 'ZAR'),
  aud(type: 'AUD');

  const Currency({
    required this.type,
  });

  final String type;
}

List<String> currencies = Currency.values.map((currency) => currency.type).toList();

Currency convertStringToCurrency({required String currencyString}) {
  final String currencyStringLC = currencyString.toLowerCase();
  return Currency.values.firstWhere((e) => e.toString() == 'Currency.$currencyStringLC');
}
