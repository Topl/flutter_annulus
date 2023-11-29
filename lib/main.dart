import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/details/block_details_page.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/widgets/model_right_sheet.dart';
import 'package:flutter_annulus/shared/constants/ui.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/transitions.dart';
import 'package:flutter_annulus/shared/widgets/slide_left_builder.dart';
import 'package:flutter_annulus/transactions/sections/details/transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/transaction_table.dart';
import 'package:flutter_annulus/utxo/widgets/utxo_details.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:vrouter/vrouter.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    const ProviderScope(
      child: ResponsiveBreakPointsWrapper(),
    ),
  );
}

class ResponsiveBreakPointsWrapper extends StatelessWidget {
  final Widget? child;
  const ResponsiveBreakPointsWrapper({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final targetChild = child ?? const AnnulusRouter();

    return ResponsiveBreakpoints.builder(
      child: targetChild,
      breakpoints: const [
        Breakpoint(start: 0, end: mobileBreak, name: MOBILE),
        Breakpoint(start: mobileBreak + 1, end: tabletBreak, name: TABLET),
        Breakpoint(start: tabletBreak + 1, end: double.infinity, name: DESKTOP),
      ],
    );
  }
}

class AnnulusRouter extends HookConsumerWidget {
  static final globalKey = GlobalKey<NavigatorState>();
  static Duration defaultDuration = const Duration(milliseconds: 200);

  const AnnulusRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      initialUrl: HomeScreen.route,
      theme: lightTheme(context: context),
      darkTheme: darkTheme(context: context),
      themeMode: ref.watch(appThemeColorProvider),
      navigatorKey: globalKey,
      routes: [
        VGuard(
          beforeEnter: (vRedirector) async {
            final String? chainId = vRedirector.newVRouterData?.pathParameters[HomeScreen.chainIdParam];
            final selectedChain = ref.read(selectedChainProvider);
            if (chainId == null) {
              vRedirector.to(HomeScreen.chainPath(selectedChain.urlName));
            } else if (chainId != selectedChain.urlName) {
              final urlChain = ChainsNotifier.standardChains.where((element) => element.hostUrl == chainId).first;

              ref.read(selectedChainProvider.notifier).state = urlChain;
            }
          },
          stackedRoutes: [
            VWidget(
              path: HomeScreen.route,
              widget: const HomeScreen(),
              buildTransition: (animation, secondaryAnimation, child) => child,
              aliases: const [
                HomeScreen.chainParamRoute,
              ],
              stackedRoutes: [
                VPage(
                  path: TransactionDetailsPage.paramRoute,
                  pageBuilder: (key, child, name) => ModelRightPage(
                    key,
                    child,
                  ),
                  widget: const TransactionDetailsPage(),
                ),
                VPage(
                  path: BlockDetailsPage.paramRoute,
                  pageBuilder: (key, child, name) => ModelRightPage(
                    key,
                    child,
                  ),
                  widget: const BlockDetailsPage(),
                ),
              ],
            ),
          ],
        ),
        VWidget(
          path: UTxODetailsPage.route, // UTxO details screen
          widget: const UTxODetailsPage(),
        ),
        VNester(
          path: '',
          widgetBuilder: (Widget child) => SlideLeftBuilder(child: child),
          buildTransition: (animation, _, child) => slideLeftTransition(animation, child),
          nestedRoutes: [
            VWidget(
              path: TransactionTableScreen.route, // Transaction table screen
              widget: const TransactionTableScreen(),
            ),

            /// TODO: Add Block Details Screen
            /// TODO: Add New Chain Screen
          ],
        ),
        VRouteRedirector(path: '*', redirectTo: '/')
      ],
    );
  }
}
