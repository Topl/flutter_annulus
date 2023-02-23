import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 70,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/leaves-logo.png',
                width: 45,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                title,
                style: const TextStyle(color: Color(0xff165867), fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            width: 500,
            child: SearchBarAnimation(
              hintText: 'Search by Block ID / Block Number / Txn ID',
              isSearchBoxOnRightSide: true,
              textEditingController: TextEditingController(),
              isOriginalAnimation: false,
              enableKeyboardFocus: true,
              onExpansionComplete: () {
                debugPrint('do something just after searchbox is opened.');
              },
              onCollapseComplete: () {
                debugPrint('do something just after searchbox is closed.');
              },
              onPressButton: (isSearchBarOpens) {
                debugPrint(
                    'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
              },
              trailingWidget: const Icon(
                Icons.search,
                size: 20,
                color: Color(0xff161616),
              ),
              secondaryButtonWidget: const Icon(
                Icons.close,
                size: 20,
                color: Color(0xff161616),
              ),
              buttonWidget: const Icon(
                Icons.search,
                size: 20,
                color: Color(0xff161616),
              ),
              hintTextColour: Color(0xff9197B3),
              durationInMilliSeconds: 550,
              enableBoxShadow: false,
              enableBoxBorder: true,
              enableButtonBorder: true,
              enableButtonShadow: true,
              buttonBorderColour: Color(0xffd2d6db).withOpacity(0.3),
              buttonShadowColour: Color(0xffd2d6db).withOpacity(0.3),
              searchBoxBorderColour: Color(0xffd2d6db).withOpacity(0.3),
            ),
          ),
        ],
      ),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: const Color(0xfff4f6f9).withOpacity(1),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
