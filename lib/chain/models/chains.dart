enum Chains {
  topl_mainnet(
    name: 'Topl Mainnet',
    host: 'mainnet.topl.network',
    port: 50051,
  ),
  valhalla_testnet(
    name: 'Valhalla Testnet',
    host: 'testnet.topl.network',
    port: 50051,
  ),
  private_network(
    name: 'Private Network',
    host: 'localhost',
    port: 50051,
  );

  const Chains({
    required this.name,
    required this.host,
    required this.port,
  });

  final String name;
  final String host;
  final int port;
}
