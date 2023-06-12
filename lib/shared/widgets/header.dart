import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:flutter_annulus/chain/sections/chainname_dropdown.dart';
import 'package:vrouter/vrouter.dart';

import '../../blocks/sections/block_details_drawer.dart';
import '../../search/models/search_result.dart';
import '../../search/providers/search_provider.dart';
import '../../transactions/sections/transaction_details_drawer.dart';
import '../utils/theme_color.dart';

class Header extends HookConsumerWidget {
  final String logoAsset;
  final VoidCallback onSearch;
  final ValueChanged<String> onDropdownChanged;

  const Header({
    Key? key,
    required this.logoAsset,
    required this.onSearch,
    required this.onDropdownChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorMode colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isSmallerThanTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
      ),
      child: Column(
        children: [
          Row(
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
              isMobile
                  ? const SizedBox()
                  : CustomSearchBar(onSearch: onSearch, colorTheme: colorTheme),
              isSmallerThanTablet
                  ? SizedBox(
                      child: IconButton(
                        onPressed: () {
                          // toggle between light and dark theme
                          showGeneralDialog(
                            context: context,
                            pageBuilder: (context, _, __) => MobileMenu(
                              onSwitchChange: () {
                                ref
                                    .read(appThemeColorProvider.notifier)
                                    .toggleTheme();
                              },
                            ),
                            barrierDismissible: true,
                            transitionDuration:
                                const Duration(milliseconds: 250),
                            barrierLabel:
                                MaterialLocalizations.of(context).dialogLabel,
                            barrierColor: Colors.black.withOpacity(0.5),
                            transitionBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutCubic,
                                ).drive(
                                  Tween<Offset>(
                                    begin: const Offset(0, -1.0),
                                    end: Offset.zero,
                                  ),
                                ),
                                child: MaterialConsumer(
                                  child: child,
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
                              color: getSelectedColor(
                                colorTheme,
                                0xFFC0C4C4,
                                0xFF4B4B4B,
                              ), // Set border color here
                              width: 1, // Set border width here
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // toggle
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
          const SizedBox(
            height: 20,
          ),
          isMobile
              ? CustomSearchBar(
                  onSearch: () {
                    // TODO: implement search
                    print("search");
                  },
                  colorTheme: colorTheme,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class MaterialConsumer extends HookConsumerWidget {
  MaterialConsumer({Key? key, required this.child}) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorMode colorTheme = ref.watch(appThemeColorProvider);

    return Column(
      children: [
        Material(
          color: colorTheme == ColorMode.light
              ? const Color.fromRGBO(254, 254, 254, 0.96)
              : const Color.fromRGBO(53, 55, 57, 0.96),
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
    );
  }
}

class MobileMenu extends HookConsumerWidget {
  MobileMenu({super.key, required this.onSwitchChange});

  final VoidCallback onSwitchChange;

  final List<String> footerLinks = [
    'Topl Privacy Policy',
    'Terms of Use',
    'Use of Cookies',
    'Cookie Preferences',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorMode colorTheme = ref.watch(appThemeColorProvider);
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    Text(
                      'Network',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Rational Display',
                        color: getSelectedColor(
                            colorTheme, 0xFF535757, 0xFFC0C4C4),
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
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Rational Display',
                        color: getSelectedColor(
                            colorTheme, 0xFF535757, 0xFFC0C4C4),
                      ),
                    ),
                    ColorModeSwitch(
                      onPressed: () {
                        // toggle between light and dark theme
                        onSwitchChange();
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFC0C4C4),
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...footerLinks
                    .map(
                      (text) => Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        child: Text(
                          text,
                          style: TextStyle(
                              color: getSelectedColor(
                                  colorTheme, 0xFF535757, 0xFFC0C4C4),
                              fontSize: 14,
                              fontFamily: 'Rational Display'),
                        ),
                      ),
                    )
                    .toList()
              ],
            ),
          )
        ],
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
      activeColor: const Color(0xFF7040EC),
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

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    Key? key,
    required this.onSearch,
    required this.colorTheme,
  }) : super(key: key);

  final VoidCallback onSearch;
  final ColorMode colorTheme;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _showSuggestions = false;
  late final String _selectedTransactionId;
  List<String> _filteredSuggestions = [];

  void _onSearchTextChanged() {
    final searchText = _searchController.text.trim();
    if (searchText.isNotEmpty) {
      final filter = _suggestions
          .where((suggestion) =>
              suggestion.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      setState(() {
        _filteredSuggestions = filter;
        _showSuggestions = true;
      });
    } else {
      setState(() {
        _showSuggestions = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  List<String> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);

    final searchProvider =
        StateNotifierProvider<SearchNotifier, AsyncValue<List<SearchResult>>>(
      (ref) => SearchNotifier(ref),
    );

    final container = ProviderContainer();

    final searchNotifier = container.read(searchProvider.notifier);

    void searchByIdAndPrintResults(int id) async {
      final searchResults = await searchNotifier.searchById(id);
      if (searchResults.isNotEmpty) {
        List<String> transactions = [];
        List<String> blocks = [];
        List<String> utxos = [];

        for (var searchResult in searchResults) {
          searchResult.when(
            transaction: (transaction) {
              final transactionId = transaction.transactionId;
              transactions.add(transactionId);
              setState(() {
                _selectedTransactionId = transactionId;
              });
            },
            block: (block) {
              final blockValue = block.epoch;
              blocks.add(blockValue.toString());
            },
            uTxO: (utxo) {
              // TODO: Handle UTxO result
            },
          );
        }
        setState(() {
          _suggestions = transactions + blocks + utxos;
        });
      } else {
        print("No results found.");
      }
    }

    return SizedBox(
      width: isDesktop ? 400 : double.infinity,
      child: Column(
        children: [
          TextField(
            style: TextStyle(
              color:
                  getSelectedColor(widget.colorTheme, 0xFF4B4B4B, 0xFF858E8E),
            ),
            controller: _searchController,
            onSubmitted: (query) => widget.onSearch(),
            onChanged: (value) {
              setState(() {
                _showSuggestions = value.isNotEmpty;
              });
              final valueId = int.tryParse(value);

              if (valueId != null) {
                searchByIdAndPrintResults(valueId);
              }
            },
            decoration: InputDecoration(
              hintText: 'Search by blocks, transactions, or UTxOs',
              hintStyle: TextStyle(
                color:
                    getSelectedColor(widget.colorTheme, 0xFF4B4B4B, 0xFF858E8E),
                fontFamily: 'Rational Display',
              ),
              prefixIcon: Icon(
                Icons.search,
                color:
                    getSelectedColor(widget.colorTheme, 0xFFC0C4C4, 0xFF4B4B4B),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getSelectedColor(
                      widget.colorTheme, 0xFFC0C4C4, 0xFF4B4B4B),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              border: const OutlineInputBorder(),
              focusColor: const Color(0xFF4B4B4B),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getSelectedColor(
                      widget.colorTheme, 0xFF4B4B4B, 0xFF858E8E),
                  width: 1.0,
                ),
              ),
            ),
          ),
          if (_showSuggestions)
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 206, 206, 206),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredSuggestions.length,
                    itemBuilder: (context, index) {
                      final suggestion = _filteredSuggestions[index];

                      final displayText = suggestion.length == 6
                          ? 'Block $suggestion'
                          : suggestion;
                      return ListTile(
                        title:
                            Text(displayText, style: const TextStyle(fontSize: 14)),
                        textColor: getSelectedColor(
                            widget.colorTheme, 0xFF4B4B4B, 0xFF858E8E),
                        onTap: () {
                          setState(() {
                            _searchController.text = suggestion;
                            _showSuggestions = false;
                          });

                          if (isDesktop && suggestion.length > 6) {
                            showModalSideSheet(
                              context: context,
                              ignoreAppBar: false,
                              width: 640,
                              barrierColor: Colors.white.withOpacity(0.64),
                              barrierDismissible: true,
                              body: TransactionDetailsDrawer(
                                transactionId: _selectedTransactionId,
                              ),
                            );
                          } else if (!isDesktop && suggestion.length > 6) {
                            context.vRouter.to(
                                '/transactions_details/$_selectedTransactionId');
                          } else {
                            showModalSideSheet(
                                context: context,
                                ignoreAppBar: true,
                                width: 640,
                                barrierColor: getSelectedColor(
                                        widget.colorTheme,
                                        0xFFFEFEFE,
                                        0xFF353739)
                                    .withOpacity(0.64),
                                barrierDismissible: true,
                                body: const BlockDetailsDrawer());
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
