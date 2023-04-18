import 'package:flutter/material.dart';
import 'package:flutter_annulus/providers/app_theme_provider.dart';

class ChainNameDropdown extends StatelessWidget {
  const ChainNameDropdown({
    super.key,
    required this.dropdownItems,
    this.colorTheme = ColorMode.light,
  });

  final List<DropdownMenuItem<String>> dropdownItems;
  final ColorMode colorTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorTheme == ColorMode.light
              ? const Color(0xFFC0C4C4)
              : const Color(0xFF4B4B4B), // Set border color here
          width: 1, // Set border width here
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                'Chain Name',
                style: TextStyle(
                  color: colorTheme == ColorMode.light
                      ? const Color(0xFF4B4B4B)
                      : const Color(0xFF858E8E),
                ),
              ),
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
