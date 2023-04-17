import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_annulus/providers/app_theme_provider.dart';

class Header extends ConsumerWidget {
  final String logoAsset;
  final VoidCallback onSearch;
  final List<DropdownMenuItem<String>> dropdownItems;
  final ValueChanged<String> onDropdownChanged;

  const Header({
    super.key,
    required this.logoAsset,
    required this.onSearch,
    required this.dropdownItems,
    required this.onDropdownChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: colorTheme == ColorMode.light
            ? const Color(0xFF272A2C)
            : const Color(0xFFFEFEFE),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            logoAsset,
            width: 48.0,
            height: 48.0,
          ),
          SizedBox(
            width: 500,
            child: TextField(
              onSubmitted: (query) => onSearch(),
              decoration: const InputDecoration(
                hintText: 'Search by blocks, transactions, or UTxOs',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                focusColor: Colors.grey,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF858E8E), width: 1.0),
                ),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // toggle between light and dark theme
                  ref.read(appThemeColorProvider.notifier).toggleTheme();
                },
                icon: const Icon(Icons.wb_sunny),
              ),
              ChainNameDropdown(dropdownItems: dropdownItems)
            ],
          )
        ],
      ),
    );
  }
}

class ChainNameDropdown extends StatelessWidget {
  const ChainNameDropdown({
    super.key,
    required this.dropdownItems,
  });

  final List<DropdownMenuItem<String>> dropdownItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5), // Set border color here
          width: 1, // Set border width here
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Row(
            children: [
              const Text('Chain Name'),
              const SizedBox(
                width: 10,
              ),
              DropdownButton<String>(
                items: dropdownItems,
                icon: const Icon(Icons.expand_more),
                onChanged: null,
                underline: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
