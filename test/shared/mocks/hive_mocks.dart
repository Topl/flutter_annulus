import 'package:flutter_annulus/shared/services/hive/hives.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hive_mocks.mocks.dart';

class MockHiveResponse {
  MockHiveInterface mockHive;
  MockBox mockCustomChainBox;
  MockBox mockRateLimitBox;
  MockHiveResponse({
    required this.mockHive,
    required this.mockCustomChainBox,
    required this.mockRateLimitBox,
  });
}

@GenerateMocks([HiveInterface, Box])
MockHiveResponse getMockHive() {
  MockHiveInterface mockHive = MockHiveInterface();

  return MockHiveResponse(
    mockHive: mockHive,
    mockCustomChainBox: getMockCustomChains(mockHive),
    mockRateLimitBox: getMockRateLimit(mockHive),
  );
}

MockBox getMockCustomChains(MockHiveInterface mockHive) {
  MockBox mockCustomChainsBox = MockBox();

  when(mockHive.openBox(Hives.customChains.id)).thenAnswer((realInvocation) async {
    return mockCustomChainsBox;
  });

  when(mockCustomChainsBox.values).thenAnswer((realInvocation) {
    return [];
  });

  return mockCustomChainsBox;
}

MockBox getMockRateLimit(MockHiveInterface mockHive) {
  MockBox mockRateLimitBox = MockBox();

  when(mockHive.openBox(Hives.rateLimit.id)).thenAnswer((realInvocation) async {
    return mockRateLimitBox;
  });

  when(mockRateLimitBox.values).thenAnswer((realInvocation) {
    return [];
  });

  return mockRateLimitBox;
}
