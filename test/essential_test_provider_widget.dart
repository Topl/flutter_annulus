// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter_annulus/main.dart';
import 'package:flutter_annulus/shared/constants/ui.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/providers/node_provider.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'required_test_class.dart';
import 'shared/mocks/genus_mocks.dart';
import 'shared/mocks/hive_mocks.dart';
import 'shared/mocks/node_config_mocks.dart';

/// The entire application, wrapped in a [ProviderScope].
/// This function exposts a named parameter called [overrides]
/// which is fed forward to the [ProviderScope].
Future<Widget> essentialTestProviderWidget({
  List<Override> overrides = const [],
  required WidgetTester tester,
  required TestScreenSizes testScreenSize,
}) async {
  // Set the size of the view
  tester.view.physicalSize = testScreenSize.size;
  tester.view.devicePixelRatio = 1.0;

  overrides = [
    genusProvider.overrideWith((ref, arg) => getMockGenus()),
    hivePackageProvider.overrideWithValue(getMockHive().mockHive),
    nodeProvider.overrideWith((ref, arg) => getMockNodeGRPCService()),
    ...overrides,
  ];

  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveBreakpoints.builder(
        breakpoints: const [
          Breakpoint(start: 0, end: mobileBreak, name: MOBILE),
          Breakpoint(start: mobileBreak + 1, end: tabletBreak, name: TABLET),
          Breakpoint(start: tabletBreak + 1, end: double.infinity, name: DESKTOP),
        ],
        child: const ResponsiveBreakPointsWrapper(),
      ),
    ),
  );
}

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final ByteData data = await load(key);
    return utf8.decode(data.buffer.asUint8List());
  }

  @override
  Future<ByteData> load(String key) async => rootBundle.load(key);
}
