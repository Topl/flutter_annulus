import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_tabbar_view.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:flutter_annulus/transactions/sections/transaction_tabbar_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/app_theme_provider.dart';

class BlockDetailsDrawer extends HookConsumerWidget {
  const BlockDetailsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorMode = ref.watch(appThemeColorProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: getSelectedColor(colorMode, 0xFFFFFFFF, 0xFF282A2C),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          titleSpacing: 10.0,
          title: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              'Block Details',
              style: TextStyle(
                  color: getSelectedColor(colorMode, 0xFF282A2C, 0xFFFEFEFE),
                  fontFamily: 'Rational Display',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          toolbarHeight: 80,
          toolbarTextStyle: const TextStyle(color: Colors.black),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: TabBar(
                  unselectedLabelColor:
                      getSelectedColor(colorMode, 0xFF282A2C, 0xFF858E8E),
                  labelColor:
                      getSelectedColor(colorMode, 0xFF282A2C, 0xFF434648),
                  labelStyle: const TextStyle(
                      fontFamily: 'Rational Display',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
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
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Tab(
                        child: Text('Summary'),
                      ),
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 40.0,
                      child: Tab(text: 'Transactions'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const BlockTabBarView(),
      ),
    );
  }
}
