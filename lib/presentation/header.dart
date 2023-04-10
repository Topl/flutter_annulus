import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              ),
            ),
          ),
          DropdownButton<String>(
            items: dropdownItems,
            onChanged: null,
            underline: Container(),
          ),
        ],
      ),
    );
  }
}
