import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_mobile_details.dart';
import 'package:flutter_annulus/blocks/sections/block_tabbar_view.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../shared/providers/app_theme_provider.dart';
import '../models/block.dart';

/// This is a custom widget that shows the block details drawer
class BlockDetailsDrawer extends HookConsumerWidget {
  const BlockDetailsDrawer({
    super.key,
    required this.block,
  });
  final Block block;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorMode = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: !isMobile
            ? AppBar(
                backgroundColor: getSelectedColor(colorMode, 0xFFFFFFFF, 0xFF282A2C),
                elevation: 0.0,
                automaticallyImplyLeading: false,
                centerTitle: false,
                titleSpacing: 10.0,
                title: Padding(
                  padding: isMobile ? const EdgeInsets.only(left: 2.0, right: 16) : const EdgeInsets.all(40.0),
                  child: Text(
                    Strings.blockDetails,
                    style: headlineLarge(context),
                  ),
                ),
                toolbarHeight: 80,
                toolbarTextStyle: const TextStyle(color: Colors.black),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 4.5,
                      child: TabBar(
                        unselectedLabelColor: getSelectedColor(colorMode, 0xFF282A2C, 0xFF858E8E),
                        labelColor: getSelectedColor(colorMode, 0xFF282A2C, 0xFF434648),
                        labelStyle: labelLarge(context),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                          color: getSelectedColor(colorMode, 0xFFE7E8E8, 0xFFFEFEFE),
                        ),
                        padding: const EdgeInsets.only(left: 30.0, top: 8.0),
                        tabs: [
                          Container(
                            width: 100.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: const Tab(
                              child: Text(Strings.summary),
                            ),
                          ),
                          const SizedBox(
                            width: 200.0,
                            height: 40.0,
                            child: Tab(text: Strings.transactions),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : null,
        body: isMobile
            ? const BlockTabBarMobileView()
            : BlockTabBarView(
                block: block,
              ),
      ),
    );
  }
}
