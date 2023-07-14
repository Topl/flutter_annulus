enum Chains {
  topl_mainnet(
    name: 'Toplnet',
    host: 'mainnet.topl.network',
    port: 50051,
  ),
  valhalla_testnet(
    name: 'Valhalla',
    host: 'testnet.topl.network',
    port: 50051,
  ),
  private_network(
    name: 'Private',
    host: 'localhost',
    port: 8080,
  ),
  dev_network(
    name: 'Development',
    host: 'testnet.topl.co',
    port: 443,
  ),
  mock(
    name: 'Mock',
    host: 'mock',
    port: 0000,
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
