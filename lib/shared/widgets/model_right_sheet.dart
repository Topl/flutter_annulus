import 'package:flutter/material.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/main.dart';
import 'package:vrouter/vrouter.dart';

class SlideFromRightModalSheetRoute<T> extends ModalRoute<T> {
  final WidgetBuilder builder;
  final bool isScrollControlled;

  SlideFromRightModalSheetRoute({
    required this.builder,
    required this.isScrollControlled,
    required RouteSettings settings,
  }) : super(settings: settings);

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  // QQQQ
  // addScopedWillPopCallback
  // @override
  // bool didPop(T? result) {
  //   print('QQQQ result $result');
  //   // VRouter.of(AnnulusRouter.globalKey.currentContext!).to(HomeScreen.route);
  //   return super.didPop(result);
  //   if (Navigator.of(navigator!.context).userGestureInProgress) {
  //     // The pop event is due to a barrier dismissal.
  //     // Perform your custom behavior here.
  //     // Return false to prevent the route from being popped.
  //     return false;
  //   } else {
  //     // The pop event is not due to a barrier dismissal.
  //     // Perform the default pop behavior.
  //     return super.didPop(result);
  //   }
  // }

  @override
  Future<RoutePopDisposition> willPop() async {
    final pathParams = VRouter.of(AnnulusRouter.globalKey.currentContext!).pathParameters;

    VRouter.of(AnnulusRouter.globalKey.currentContext!).to(HomeScreen.chainPath(pathParams[HomeScreen.chainIdParam]!));

    return RoutePopDisposition.doNotPop;
  }

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
    return SlideFromRightModalSheetRoute(
      builder: (_) => child,
      isScrollControlled: true,
      settings: this,
    );
  }
}
