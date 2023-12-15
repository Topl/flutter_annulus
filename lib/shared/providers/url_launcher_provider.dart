import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// This provider is used so that in tests we can mock the DateTime.now() function
final urlLauncherProvider = Provider<Future<bool> Function(Uri)>((ref) {
  return (Uri url) => launchUrl(url);
});
