import 'package:flutter/material.dart';
import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:flutter_annulus/providers/app_theme_provider.dart';

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
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

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
              color: widget.colorTheme == ColorMode.light
                  ? const Color(0xFF4B4B4B)
                  : const Color(0xFF858E8E),
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.colorTheme == ColorMode.light
                            ? const Color(0xFF4B4B4B)
                            : const Color(0xFF858E8E),
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
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
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF858E8E),
            ),
            iconSize: 20,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              decoration: BoxDecoration(
                color: widget.colorTheme == ColorMode.light
                    ? const Color(0xFFFEFEFE)
                    : const Color(0xFF282A2C),
              ),
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search ...',
                  hintStyle: TextStyle(
                    color: widget.colorTheme == ColorMode.light
                        ? const Color(0xFF4B4B4B)
                        : const Color(0xFF858E8E),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.colorTheme == ColorMode.light
                          ? const Color(0xFFC0C4C4)
                          : const Color(0xFF4B4B4B),
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return (item.value.toString().contains(searchValue));
            },
          ),
          //This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}
