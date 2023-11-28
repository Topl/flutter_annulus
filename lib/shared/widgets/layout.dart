import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/sections/chainname_dropdown.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../providers/app_theme_provider.dart';
import '../utils/theme_color.dart';

/// This is a custom layout widget that displays a header, content and footer.
class CustomLayout extends HookConsumerWidget {
  final Widget header;
  final Widget content;
  final Widget footer;
  final Widget? mobileHeader;

  const CustomLayout({
    Key? key,
    required this.header,
    required this.content,
    required this.footer,
    this.mobileHeader,
  }) : super(key: key);

  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    final ThemeMode colorTheme = ref.watch(appThemeColorProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      endDrawer: Container(
        height: 500,
        margin: EdgeInsets.only(bottom: isTablet ? 520 : 320),
        color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Drawer(
            backgroundColor: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ListView(
                      key: const PageStorageKey(0),
                      padding: const EdgeInsets.only(top: 30),
                      children: <Widget>[
                        ListTile(
                          title: ChainNameDropDown(
                            colorTheme: colorTheme,
                            onItemSelected: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: null,
      body: Column(
        children: [
          // Header widget
          Container(color: Colors.white, child: header),
          // Content widget
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    content,
                    Container(
                      color: Colors.white,
                      child: SingleChildScrollView(child: footer),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
