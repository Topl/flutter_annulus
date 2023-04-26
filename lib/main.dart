import 'package:flutter/material.dart';
import 'package:flutter_annulus/extensions/widget_extensions.dart';
import 'package:flutter_annulus/presentation/header.dart';
import 'package:flutter_annulus/presentation/layout.dart';
import 'package:flutter_annulus/widgets/hero_metrics/main.dart';
import 'package:vrouter/vrouter.dart';
import 'widgets/block_slider.dart';

import 'package:flutter_annulus/providers/app_theme_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AnnulusApp()));
}

class AnnulusApp extends ConsumerWidget {
  const AnnulusApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      home: CustomLayout(
        header: Header(
          logoAsset: colorTheme == ColorMode.light ? 'images/logo.svg' : 'images/logo_dark.svg',
          onSearch: () {},
          onDropdownChanged: (String value) {},
        ),
        content: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: HeroMetrics(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      child: const Text("right"),
                    ),
                  )
                ],
              ),
            ),
            const BlockViewSlider()
          ],
        ),
        footer: Container(
          height: 100,
          alignment: Alignment.center,
          child: const Text("footer"),
        ),
      ),
    );
  }
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
          nestedRoutes: [
            VWidget(
              path: TransactionDetailsScreen.route,
              widget: const TransactionDetailsScreen(),
            ),
            VWidget(
              path: BlockDetailsScreen.route,
              widget: const BlockDetailsScreen(),
            ),
            VWidget(
              path: AddNetworkScreen.route,
              widget: const AddNetworkScreen(),
            ),
          ],
        ),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  static const route = '/';
  const HomeScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TransactionDetailsScreen extends StatelessWidget {
  static const route = '/transaction/:id';

  const TransactionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BlockDetailsScreen extends StatelessWidget {
  static const route = '/block/:id';

  const BlockDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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

class AddNetworkScreen extends StatelessWidget {
  static const route = '/add_network';

  const AddNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

SlideTransition slideLeftTransition(Animation<double> animation, Widget child) => SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
