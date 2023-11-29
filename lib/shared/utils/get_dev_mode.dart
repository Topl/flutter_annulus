import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart';

bool getDevMode() {
  var url = window.location.href;
  //TODO: use vRouter to get url once vRouter provider is setup
  //final url = VRouter.of(context).url;
  if (url.contains('tech')) {
    return true;
  } else {
    return kDebugMode;
  }
}
