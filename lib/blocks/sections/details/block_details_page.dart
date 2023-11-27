import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/details/desktop_block_details_page.dart';
import 'package:flutter_annulus/blocks/sections/details/mobile_block_details_page.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';

/// This is a custom widget that shows the block details page
class BlockDetailsPage extends HookConsumerWidget {
  const BlockDetailsPage({
    Key? key,
  }) : super(key: key);

  static const String _blockIdParam = 'blockId';
  static const String _route = '/block_details/';
  static const String paramRoute = '${HomeScreen.chainParamRoute}$_route:$_blockIdParam';
  static String blockDetailsPath(String blockId, String chainId) {
    return '${HomeScreen.chainPath(chainId)}$_route$blockId';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? blockId = context.vRouter.pathParameters[_blockIdParam];
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);

    if (blockId == null) {
      context.vRouter.to('/');
    }

    if (isDesktop) {
      return DesktopBlockDetailsPage(
        blockId: blockId!,
      );
    } else {
      return MobileBlockDetailsPage(
        blockId: blockId!,
      );
    }
  }
}
