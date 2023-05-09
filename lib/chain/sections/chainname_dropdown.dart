import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import 'add_new_network.dart';

class ChainNameDropDown extends StatefulWidget {
  const ChainNameDropDown({Key? key, this.colorTheme = ColorMode.light})
      : super(key: key);

  final ColorMode colorTheme;

  @override
  State<ChainNameDropDown> createState() => _ChainNameDropDownState();
}

class _ChainNameDropDownState extends State<ChainNameDropDown> {
  final List<String> items = [
    'Toplnet',
    'Valhalla',
    'Private',
  ];
  // List of items in our dropdown menu
  final List<String> currencies = [
    'LVL',
    'USD',
    'EUR',
    'GBP',
    'ZAR',
    'AUD',
  ];
  String? selectedValue;
  bool isDropDownOpen = false;
  bool isCDropDownOpen = false;
  bool validate = false;
  String? selectedCurrencyValue = 'LVL';
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Chain Name',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Rational Display',
              color: widget.colorTheme == ColorMode.light
                  ? const Color(0xFF4B4B4B)
                  : const Color(0xFF858E8E),
            ),
          ),
          items: [
            ...items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Row(
                        children: [
                          Text(
                            item,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Rational Display',
                              color: widget.colorTheme == ColorMode.light
                                  ? const Color(0xFF535757)
                                  : const Color(0xFF858E8E),
                            ),
                          ),
                          const SizedBox(width: 32),
                          Icon(
                            Icons.check,
                            color: const Color(0xFF7040EC),
                            size: selectedValue == item ? 24 : 0,
                          ),
                        ],
                      ),
                    ))
                .toList(),
            DropdownMenuItem(
              value: 'Add new',
              child: TextButton(
                onPressed: () {
                  showModalSideSheet(
                      context: context,
                      ignoreAppBar: false,
                      width: 640,
                      barrierColor: Colors.white.withOpacity(0.64),
                      // with blur,
                      barrierDismissible: true,
                      body: AddNewNetworkContainer(
                        colorTheme: widget.colorTheme,
                      ));
                },
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Color(0xFF535757), size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Add new',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Rational Display',
                        color: widget.colorTheme == ColorMode.light
                            ? const Color(0xFF535757)
                            : const Color(0xFF858E8E),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          value: selectedValue,
          selectedItemBuilder: (context) => items
              .map((item) => Row(
                    children: [
                      Text(
                        item,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Rational Display Normal',
                          color: widget.colorTheme == ColorMode.light
                              ? const Color(0xFF535757)
                              : const Color(0xFF858E8E),
                        ),
                      ),
                    ],
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 40,
            width: 160,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: widget.colorTheme == ColorMode.light
                    ? const Color(0xFFC0C4C4)
                    : const Color(0xFF4B4B4B),
              ),
              color: widget.colorTheme == ColorMode.light
                  ? const Color(0xFFFEFEFE)
                  : const Color(0xFF282A2C),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(
              color: widget.colorTheme == ColorMode.light
                  ? const Color(0xFFFEFEFE)
                  : const Color(0xFF282A2C),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          iconStyleData: IconStyleData(
            icon: isDropDownOpen
                ? const Icon(
                    Icons.keyboard_arrow_up,
                    color: Color(0xFF858E8E),
                  )
                : const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF858E8E),
                  ),
            iconSize: 20,
          ),
          onMenuStateChange: (isOpen) {
            setState(() {
              isDropDownOpen = !isDropDownOpen;
            });
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}
