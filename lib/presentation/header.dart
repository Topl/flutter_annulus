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
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                focusColor: Colors.grey,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.brightness_4),
            style: ButtonStyle(
            
              backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
              shape: MaterialStateProperty.all(
                const CircleBorder(),
              ),
            ),
            onPressed: () {
              null;
            }),
          Container(
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
                const Text('Chain Name'),
                const SizedBox(width: 10,),
                DropdownButton<String>(
                  items: dropdownItems,
                  icon: const Icon(Icons.expand_more),
                  onChanged: null,
                  underline: Container(),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}