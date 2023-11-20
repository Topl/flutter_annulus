import 'package:flutter/material.dart';

class SlideFromRightModalBottomSheetRoute<T> extends ModalRoute<T> {
  final WidgetBuilder builder;
  final bool isScrollControlled;

  SlideFromRightModalBottomSheetRoute({
    required this.builder,
    required this.isScrollControlled,
    required RouteSettings settings,
  }) : super(settings: settings);

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => "Close";

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final childWidth = constraints.maxWidth;
        final beginOffset = childWidth / screenWidth;

        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(beginOffset, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}

class ModelRightPage extends Page {
  @override
  final LocalKey key;

  final Widget child;

  const ModelRightPage(this.key, this.child) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return SlideFromRightModalBottomSheetRoute(
      builder: (_) => child,
      isScrollControlled: true,
      settings: this,
    );
  }
}
