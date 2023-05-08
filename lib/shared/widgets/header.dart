import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';

import 'package:flutter_annulus/chain/sections/chainname_dropdown.dart';

class Header extends ConsumerWidget {
  final String logoAsset;
  final VoidCallback onSearch;
  final ValueChanged<String> onDropdownChanged;

  const Header({
    super.key,
    required this.logoAsset,
    required this.onSearch,
    required this.onDropdownChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorMode colorTheme = ref.watch(appThemeColorProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: colorTheme == ColorMode.light
            ? const Color(0xFFFEFEFE)
            : const Color(0xFF282A2C),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          SvgPicture.asset(
            logoAsset,
            width: 48.0,
            height: 48.0,
          ),
          //Search bar
          SizedBox(
            width: 500,
            child: TextField(
              onSubmitted: (query) => onSearch(),
              decoration: InputDecoration(
                hintText: 'Search by blocks, transactions, or UTxOs',
                hintStyle: TextStyle(
                  color: colorTheme == ColorMode.light
                      ? const Color(0xFF4B4B4B)
                      : const Color(0xFF858E8E),
                  fontFamily: 'Rational Display',
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: colorTheme == ColorMode.light
                      ? const Color(0xFFC0C4C4)
                      : const Color(0xFF4B4B4B),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorTheme == ColorMode.light
                        ? const Color(0xFFC0C4C4)
                        : const Color(0xFF4B4B4B),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                border: const OutlineInputBorder(),
                focusColor: const Color(0xFF4B4B4B),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: colorTheme == ColorMode.light
                          ? const Color(0xFF4B4B4B)
                          : const Color(0xFF858E8E),
                      width: 1.0),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorTheme == ColorMode.light
                        ? const Color(0xFFC0C4C4)
                        : const Color(0xFF4B4B4B), // Set border color here
                    width: 1, // Set border width here
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: IconButton(
                  onPressed: () {
                    // toggle between light and dark theme
                    ref.read(appThemeColorProvider.notifier).toggleTheme();
                  },
                  icon: colorTheme == ColorMode.light
                      ? const Icon(
                          Icons.light_mode,
                          color: Color(0xFF858E8E),
                          size: 20.0,
                        )
                      : const Icon(
                          Icons.dark_mode,
                          color: Color(0xFF858E8E),
                          size: 20.0,
                        ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ChainNameDropDown(
                colorTheme: colorTheme,
              )
            ],
          )
        ],
      ),
    );
  }
}
