enum Hives {
  customChains(
    id: 'customChains',
  ),
  blocks(
    id: 'blocks',
  ),
  transactions(
    id: 'transactions',
  );

  const Hives({
    required this.id,
  });

  final String id;
}
