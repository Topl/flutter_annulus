import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_annulus/search/sections/search_results.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/search_provider.dart';
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

  /// Shows the overlay or dropdown on the search bar
  void showOverlay(
    BuildContext context,
    ValueNotifier<OverlayEntry?> entry,
    Function resultSelected,
  ) {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry.value = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: SearchResults(
          resultSelected: () => resultSelected(),
        ),
      ),
    );

    overlay.insert(entry.value!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layerLink = LayerLink();

    /// The controller used to control the search text field.
    final searchController = useTextEditingController();
    final searchText = useState('');

    final ValueNotifier<OverlayEntry?> entry = useState(null);

    useValueChanged<String, String>(searchText.value, (oldValue, oldResult) {
      if (oldValue.isEmpty && searchText.value.isNotEmpty) {
        Future.delayed(Duration.zero, () {
          showOverlay(context, entry, () {
            entry.value?.remove();
          });
        });
      } else if (oldValue.isNotEmpty && searchText.value.isEmpty) {
        entry.value?.remove();
      }
      return searchText.value;
    });

    /// The debouncer used to debounce the search text field.
    final Debouncer searchDebouncer = Debouncer(milliseconds: 200);

    final searchNotifier = ref.read(searchProvider.notifier);

    // Performs a search by calling `searchNotifier.searchById` with the given ID,
    // processes the results, and updates relevant values and lists.
    Future<void> performSearch(String id) async {
      searchNotifier.searchById(id);
    }

    /// Runs the search debouncer with the given ID and prints the results.
    Future<void> searchByIdAndPrintResults(String id) async {
      searchDebouncer.run(() => performSearch(id));
    }

    return CompositedTransformTarget(
      link: layerLink,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: bodyMedium(context),
              controller: searchController,
              onSubmitted: (query) => onSearch(),
              onChanged: (value) {
                searchText.value = value;
                if (value.isNotEmpty) {
                  searchByIdAndPrintResults(value);
                }
              },
              decoration: InputDecoration(
                hintText: Strings.searchHintText,
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
        ],
      ),
    );
  }
}
