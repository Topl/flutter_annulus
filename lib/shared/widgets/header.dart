import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:flutter_annulus/chain/sections/chainname_dropdown.dart';

import '../utils/theme_color.dart';

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
        color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
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
          ResponsiveBreakpoints.of(context).isMobile
              ? const SizedBox()
              : SearchBar(onSearch: onSearch, colorTheme: colorTheme),
          ResponsiveBreakpoints.of(context).isMobile
              ? SizedBox(
                  child: IconButton(
                    onPressed: () {
                      // toggle between light and dark theme
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, _, __) =>
                            MobileMenu(colorTheme: colorTheme),
                        barrierDismissible: true,
                        transitionDuration: const Duration(milliseconds: 250),
                        barrierLabel:
                            MaterialLocalizations.of(context).dialogLabel,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOutCubic)
                                .drive(
                              Tween<Offset>(
                                  begin: const Offset(0, -1.0),
                                  end: Offset.zero),
                            ),
                            child: Column(
                              children: [
                                Material(
                                  color:
                                      const Color.fromRGBO(254, 254, 254, 0.96),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: child,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 24.0,
                    ),
                  ),
                )
              : Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: getSelectedColor(colorTheme, 0xFFC0C4C4,
                              0xFF4B4B4B), // Set border color here
                          width: 1, // Set border width here
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // toggle between light and dark theme
                          ref
                              .read(appThemeColorProvider.notifier)
                              .toggleTheme();
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
                ),
        ],
      ),
    );
  }
}

class MobileMenu extends StatelessWidget {
  MobileMenu({super.key, required this.colorTheme});

  ColorMode colorTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: 440,
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    size: 24.0,
                    color: Color(0xFF858E8E),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Network',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rational Display',
                  ),
                ),
                ChainNameDropDown(
                  colorTheme: colorTheme,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rational Display',
                  ),
                ),
                ColorModeSwitch(onPressed: () {
                  print("hello");
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ColorModeSwitch extends StatefulWidget {
  const ColorModeSwitch({Key? key, required this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  State<ColorModeSwitch> createState() => _ColorModeSwitchState();
}

class _ColorModeSwitchState extends State<ColorModeSwitch> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: darkMode,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          darkMode = value;
        });
        widget.onPressed();
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.onSearch,
    required this.colorTheme,
  });

  final VoidCallback onSearch;
  final ColorMode colorTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextField(
        onSubmitted: (query) => onSearch(),
        decoration: InputDecoration(
          hintText: 'Search by blocks, transactions, or UTxOs',
          hintStyle: TextStyle(
            color: getSelectedColor(colorTheme, 0xFF4B4B4B, 0xFF858E8E),
            fontFamily: 'Rational Display',
          ),
          prefixIcon: Icon(
            Icons.search,
            color: getSelectedColor(colorTheme, 0xFFC0C4C4, 0xFF4B4B4B),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: getSelectedColor(colorTheme, 0xFFC0C4C4, 0xFF4B4B4B),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: const OutlineInputBorder(),
          focusColor: const Color(0xFF4B4B4B),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: getSelectedColor(colorTheme, 0xFF4B4B4B, 0xFF858E8E),
                width: 1.0),
          ),
        ),
      ),
    );
  }
}
