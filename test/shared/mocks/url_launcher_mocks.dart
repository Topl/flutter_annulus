import 'package:mockito/mockito.dart';
import 'package:flutter_annulus/shared/providers/url_launcher_provider.dart';

class MockUrlLauncher extends Mock implements UrlLauncher {
  @override
  Future<bool> launchURL(Uri url) async {
    return true;
  }
}
