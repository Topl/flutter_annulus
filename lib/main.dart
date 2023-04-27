import 'package:flutter/material.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/utils/transitions.dart';
import 'package:vrouter/vrouter.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AnnulusRouter(),
    ),
  );
}

class AnnulusRouter extends StatelessWidget {
  const AnnulusRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      initialUrl: HomeScreen.route,
      routes: [
        VWidget(
          path: HomeScreen.route,
          widget: const HomeScreen(),
        ),
        VNester(
          path: '',
          widgetBuilder: (Widget child) => SlideLeftBuilder(child: child),
          buildTransition: (animation, _, child) => slideLeftTransition(animation, child),
          nestedRoutes: const [
            /// TODO: Add Tansaction Details Screen
            /// TODO: Add Block Details Screen
            /// TODO: Add New Chain Screen
          ],
        ),
      ],
    );
  }
}

class SlideLeftBuilder extends StatelessWidget {
  final Widget child;
  const SlideLeftBuilder({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
