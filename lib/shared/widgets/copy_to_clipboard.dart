import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyToClipboard extends StatelessWidget {
  const CopyToClipboard({
    super.key,
    required this.rightText,
  });

  final String rightText;
  static const copyIconKey = Key('copyIconKey');
  static const snackBarKey = Key('snackBarKey');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: copyIconKey,
        onTap: () {
          Clipboard.setData(ClipboardData(text: rightText));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Copied to Clipboard'),
              duration: Duration(seconds: 5),
            ),
          );
        },
        child: const Icon(Icons.copy));
  }
}
