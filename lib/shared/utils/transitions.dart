import 'package:flutter/material.dart';

SlideTransition slideLeftTransition(Animation<double> animation, Widget child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
