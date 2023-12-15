import 'package:mockito/annotations.dart';
import 'package:flutter_annulus/shared/providers/url_launcher_provider.dart';
import 'package:mockito/mockito.dart';

import 'url_launcher_mocks.mocks.dart';

@GenerateMocks([UrlLauncher])
getMockUrlLauncher() {
  final urlLauncher = MockUrlLauncher();

  when(urlLauncher.launchURL(Uri.parse('https://faucet.topl.co#/'))).thenAnswer((realInvocation) async {
    return true;
  });
}
