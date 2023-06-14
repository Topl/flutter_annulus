import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:vrouter/vrouter.dart';

import '../../blocks/sections/block_details_drawer.dart';
import '../../search/models/search_result.dart';
import '../../search/providers/search_provider.dart';
import '../../transactions/sections/transaction_details_drawer.dart';
import '../utils/theme_color.dart';

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
  late final Block _selectedBlock;
  bool isUTxO = false;
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
      if (searchResults != null) {
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
              setState(() {
                _selectedBlock = block;
              });
            },
            uTxO: (utxo) {
              // TODO: Handle UTxO result
              const utxoValue = "0x5be9d701Byd24neQfY1vXa987a";
              utxos.add(utxoValue);
              setState(() {
                isUTxO = true;
              });
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
          if (_showSuggestions && _filteredSuggestions.isNotEmpty)
            Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
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
                              Text(displayText, style: TextStyle(fontSize: 14)),
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
                                  body: BlockDetailsDrawer(
                                    block: _selectedBlock,
                                  ));
                            }
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
