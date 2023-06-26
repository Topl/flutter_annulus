import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:vrouter/vrouter.dart';

import '../../blocks/sections/block_details_drawer.dart';
import '../providers/search_provider.dart';
import '../../transactions/sections/transaction_details_drawer.dart';
import '../../shared/utils/debouncer.dart';
import '../../shared/utils/theme_color.dart';

/// A custom search bar widget that displays a search bar and a list of
class CustomSearchBar extends HookConsumerWidget {
  const CustomSearchBar({
    Key? key,
    required this.onSearch,
    required this.colorTheme,
  }) : super(key: key);

  final VoidCallback onSearch;
  final ThemeMode colorTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
    final layerLink = LayerLink();

    /// The controller used to control the search text field.
    final searchController = useTextEditingController();
    final showSuggestions = useState(false);
    final selectedTransactionId = useState('');
    final selectedBlock = useState<Block?>(null);
    final isUTxO = useState(false);

    OverlayEntry? entry;

    /// The list of filtered suggestions to display.
    final filteredSuggestions = useState<List<String>>([]);

    /// The list of suggestions to display.
    final suggestions = useState<List<String>>([]);

    /// The debouncer used to debounce the search text field.
    final Debouncer searchDebouncer = Debouncer(milliseconds: 200);

    // Updates the suggestions list based on the current search text.
    void onSearchTextChanged() {
      final searchText = searchController.text.trim();
      if (searchText.isNotEmpty) {
        final filter = suggestions.value
            .where((suggestion) => suggestion.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
        showSuggestions.value = true;
        filteredSuggestions.value = filter;
      } else {
        showSuggestions.value = false;
      }
    }

    useEffect(() {
      searchController.addListener(onSearchTextChanged);
      return () {
        searchController.removeListener(onSearchTextChanged);
      };
    }, []);

    final searchProvider = StateNotifierProvider(
      (ref) => SearchNotifier(ref),
    );

    final searchNotifier = ref.read(searchProvider.notifier);

    // Performs a search by calling `searchNotifier.searchById` with the given ID,
    // processes the results, and updates relevant values and lists.
    Future<void> performSearch(int id) async {
      final searchResults = await searchNotifier.searchById(id);
      if (searchResults.isNotEmpty) {
        final transactions = <String>[];
        final blocks = <String>[];
        final utxos = <String>[];

        for (var searchResult in searchResults) {
          searchResult.when(
            transaction: (transaction) {
              final transactionId = transaction.transactionId;
              transactions.add(transactionId);
              selectedTransactionId.value = transactionId;
            },
            block: (block) {
              final blockValue = block.epoch;
              blocks.add(blockValue.toString());
              selectedBlock.value = block;
            },
            uTxO: (utxo) {
              // TODO: Handle UTxO result
              const utxoValue = "10x5be9d701Byd24neQfY1vXa987a";
              utxos.add(utxoValue);
              isUTxO.value = true;
            },
          );
        }
        print('suggestions $transactions');
        suggestions.value = transactions + blocks + utxos;
      } else {
        print("No results found.");
      }
    }

    /// Runs the search debouncer with the given ID and prints the results.
    Future<void> searchByIdAndPrintResults(int id) async {
      searchDebouncer.run(() => performSearch(id));
    }

    void closeOverlay() {
      entry?.remove();
      entry = null;
    }

    /// Builds the overlay to display when the search bar is focused.
    Widget buildOverlay() => Visibility(
          visible: showSuggestions.value && filteredSuggestions.value.isNotEmpty,
          child: Material(
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
                itemCount: filteredSuggestions.value.length,
                itemBuilder: (context, index) {
                  final suggestion = filteredSuggestions.value[index];

                  final displayText = suggestion.length == 6 ? 'Block $suggestion' : suggestion;
                  return ListTile(
                    title: Text(displayText, style: bodyMedium(context)),
                    textColor: getSelectedColor(
                      colorTheme,
                      0xFF4B4B4B,
                      0xFF858E8E,
                    ),
                    onTap: () {
                      searchController.text = suggestion;
                      showSuggestions.value = false;
                      closeOverlay();
                      if (isDesktop && suggestion.length > 6 && suggestion != "10x5be9d701Byd24neQfY1vXa987a") {
                        showModalSideSheet(
                          context: context,
                          ignoreAppBar: true,
                          width: 640,
                          barrierColor: getSelectedColor(
                            colorTheme,
                            0xFFFEFEFE,
                            0xFF353739,
                          ).withOpacity(0.64),
                          barrierDismissible: true,
                          body: TransactionDetailsDrawer(
                            transactionId: selectedTransactionId.value,
                          ),
                        );
                      } else if (!isDesktop && suggestion.length > 6 && suggestion != "10x5be9d701Byd24neQfY1vXa987a") {
                        context.vRouter.to(
                          '/transactions_details/${selectedTransactionId.value}',
                        );
                      } else if (suggestion == "10x5be9d701Byd24neQfY1vXa987a") {
                        context.vRouter.to(
                          '/utxo_details/',
                        );
                      } else {
                        isDesktop
                            ? showModalSideSheet(
                                context: context,
                                ignoreAppBar: true,
                                width: 640,
                                barrierColor: getSelectedColor(
                                  colorTheme,
                                  0xFFFEFEFE,
                                  0xFF353739,
                                ).withOpacity(0.64),
                                barrierDismissible: true,
                                body: BlockDetailsDrawer(
                                  block: selectedBlock.value as Block,
                                ),
                              )
                            : context.vRouter.to("/block_details");
                      }
                    },
                  );
                },
              ),
            ),
          ),
        );

    /// Shows the overlay or dropdown on the search bar
    void showOverlay() {
      final overlay = Overlay.of(context);
      final renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;
      final offset = renderBox.localToGlobal(Offset.zero);
      entry = OverlayEntry(
          builder: (context) =>
              Positioned(left: offset.dx, top: offset.dy + size.height, width: size.width, child: buildOverlay()));

      overlay.insert(entry!);
    }

    return Expanded(
      child: CompositedTransformTarget(
        link: layerLink,
        child: TextField(
          style: bodyMedium(context),
          controller: searchController,
          onSubmitted: (query) => onSearch(),
          onChanged: (value) {
            showSuggestions.value = value.isNotEmpty;
            final valueId = int.tryParse(value);

            if (valueId != null) {
              searchByIdAndPrintResults(valueId);
            }
            showOverlay();
          },
          decoration: InputDecoration(
            hintText: 'Search by blocks, transactions, or UTxOs',
            hintStyle: bodyMedium(context),
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
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
