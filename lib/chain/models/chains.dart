enum Chains {
  topl_mainnet(
    name: 'Topl Mainnet',
  ),
  valhalla_testnet(
    name: 'Valhalla Testnet',
  ),
  private_network(
    name: 'Private Network',
  );

  const Chains({
    required this.name,
  });

  final String name;
}
