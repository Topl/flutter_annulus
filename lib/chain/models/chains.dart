// Package imports:
import 'package:flutter_annulus/chain/models/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chains.freezed.dart';

part 'chains.g.dart';

@freezed
sealed class Chains with _$Chains {
  const factory Chains.topl_mainnet({
    @Default('Toplnet') String networkName,
    @Default('mainnet.topl.co') String hostUrl,
    @Default(443) int port,
  }) = ToplMainnet;
  const factory Chains.valhalla_testnet({
    @Default('Valhalla') String networkName,
    @Default('testnet.topl.network') String hostUrl,
    @Default(50051) int port,
  }) = ValhallaTestNet;
  const factory Chains.private_network({
    @Default('Private') String networkName,
    @Default('localhost') String hostUrl,
    @Default(8080) int port,
  }) = PrivateNetwork;
  const factory Chains.dev_network({
    @Default('Development') String networkName,
    @Default('testnet.topl.co') String hostUrl,
    @Default(443) int port,
  }) = DevNetwork;
  const factory Chains.mock({
    @Default('Mock') String networkName,
    @Default('mock') String hostUrl,
    @Default(0000) int port,
  }) = MockNetwork;
  const factory Chains.custom({
    required String chainId,
    required String networkName,
    required String hostUrl,
    required int port,
    required Currency currency,
    String? blockExplorerUrl,
  }) = CustomNetwork;

  factory Chains.fromJson(Map<String, dynamic> json) => _$ChainsFromJson(json);
}

List<dynamic> splitUrl({required String completeUrl}) {
  // '<route:port>'
  final splitUrl = completeUrl.split(':');

  if (splitUrl.length > 2) {
    throw Exception('Invalid Url');
  }

  var port = int.tryParse(splitUrl[1]);
  if (port == null) {
    throw Exception('Invalid port');
  }

  return [splitUrl[0], port];
}

void validateCustomChain(CustomNetwork chain) {
  if (chain.chainId.isEmpty) {
    throw Exception('CustomNetwork: chainId cannot be empty');
  }
  if (chain.networkName.isEmpty) {
    throw Exception('CustomNetwork: networkName cannot be empty');
  }
  if (chain.hostUrl.isEmpty) {
    throw Exception('CustomNetwork: hostUrl cannot be empty');
  }
  if (chain.port <= 0) {
    throw Exception('CustomNetwork: invalid port');
  }
  //currency is handled by CustomNetwork constructor
  //check for empty string only if blockExplorerUrl is not null
  if (chain.blockExplorerUrl?.isEmpty ?? false) {
    throw Exception('CustomNetwork: blockExplorerUrl cannot be empty');
  }
}
