import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../theme.dart';

class FailedToLoad extends StatelessWidget {
  const FailedToLoad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.warning_amber_rounded,
          color: Color(0xFFF07575),
          size: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          Strings.failedToLoad,
          style: titleLarge(context),
        ),
      ],
    );
  }
}
