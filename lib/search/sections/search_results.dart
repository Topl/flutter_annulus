import 'package:flutter/material.dart';
import 'package:flutter_annulus/search/models/search_result.dart';
import 'package:flutter_annulus/search/providers/search_provider.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchResults extends HookConsumerWidget {
  final Function(SearchResult) resultSelected;
  const SearchResults({
    required this.resultSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    List<SearchResult> results = ref.watch(searchProvider);
    bool isLoading = ref.watch(isLoadingRpcSearchResultsProvider);
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 206, 206, 206),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SizedBox(
          height: 200,
          child: ListView(
            children: [
              // List items from results
              for (SearchResult suggestion in results)
                _SearchResultItem(
                  suggestion: suggestion,
                  colorTheme: colorTheme,
                  resultSelected: resultSelected,
                ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (results.isEmpty && !isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text("No results found"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final SearchResult suggestion;
  final ThemeMode colorTheme;
  final Function(SearchResult) resultSelected;
  const _SearchResultItem({
    required this.suggestion,
    required this.colorTheme,
    required this.resultSelected,
    Key? key,
  }) : super(key: key);

  String itemType() {
    return suggestion.map(
      transaction: (_) => 'Transaction',
      block: (_) => 'Block',
      uTxO: (_) => 'Utxo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${itemType()} ${suggestion.id}', style: bodyMedium(context)),
      textColor: getSelectedColor(
        colorTheme,
        0xFF4B4B4B,
        0xFF858E8E,
      ),
      onTap: () {
        resultSelected(suggestion);
      },
    );
  }
}
