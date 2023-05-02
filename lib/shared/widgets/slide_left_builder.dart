import 'package:flutter/material.dart';

class SlideLeftBuilder extends StatelessWidget {
  final Widget child;
  const SlideLeftBuilder({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
