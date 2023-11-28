enum Hives {
  customChains(
    id: 'customChains',
  ),
  blocks(
    id: 'blocks',
  ),
  transactions(
    id: 'transactions',
  ),
  rateLimit(
    id: 'rateLimit',
  );

  const Hives({
    required this.id,
  });

  final String id;
}
