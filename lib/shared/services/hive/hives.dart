enum Hives {
  customChains(
    id: 'customChains',
  ),
  blocks(
    id: 'blocks',
  );

  const Hives({
    required this.id,
  });

  final String id;
}
