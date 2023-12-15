import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<bool> launchURL(Uri url) async {
    launchUrl(url);
    return true;
  }
}

// This provider is used so that in tests we can mock the DateTime.now() function
final urlLauncherProvider = Provider<UrlLauncher>((ref) {
  return UrlLauncher();
});
