import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../shared/utils/theme_color.dart';
import 'add_new_network.dart';

class ChainNameDropDown extends StatefulWidget {
  const ChainNameDropDown({Key? key, this.colorTheme = ThemeMode.light, this.onItemSelected}) : super(key: key);

  final ThemeMode colorTheme;
  final void Function()? onItemSelected;

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
    final IsResponsive = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return IsResponsive
        ? Row(
            children: [
              Expanded(
                child: Text(
                  "Network",
                  style: bodyMedium(context),
                ),
              ),
              DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                isExpanded: true,
                hint: CustomTextWidget(widget: widget),
                items: [
                  ...items
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Row(
                              children: [
                                Text(
                                  item,
                                  style: bodyMedium(context),
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: getSelectedColor(
                              widget.colorTheme,
                              0xFF535757,
                              0xFF858E8E,
                            ),
                            width: 0.2,
                          ),
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showModalSideSheet(
                                context: context,
                                ignoreAppBar: true,
                                width: 640,
                                barrierColor: Colors.white.withOpacity(0.64),
                                // with blur,
                                barrierDismissible: true,
                                body: AddNewNetworkContainer(
                                  colorTheme: widget.colorTheme,
                                ));

                            widget.onItemSelected?.call();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Row(
                              children: [
                                const Icon(Icons.add, color: Color(0xFF535757), size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  'Add new',
                                  style: bodyMedium(context),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                ],
                value: selectedValue,
                selectedItemBuilder: (context) => items
                    .map((item) => Row(
                          children: [
                            CustomItem(
                              widget: widget,
                              item: item,
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
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: getSelectedColor(widget.colorTheme, 0x809E9E9E, 0xFF4B4B4B),
                    ),
                    color: getSelectedColor(widget.colorTheme, 0xFFF5F5F5, 0xFF4B4B4B),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 345,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: getSelectedColor(widget.colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                    ),
                    offset: const Offset(-185, -6),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    )),
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
              )),
            ],
          )
        : Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: CustomTextWidget(widget: widget),
                items: [
                  ...items
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Row(
                              children: [
                                CustomItem(
                                  widget: widget,
                                  item: item,
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
                            style: bodyMedium(context),
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
                              style: bodySmall(context),
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
                      color: getSelectedColor(widget.colorTheme, 0xFFC0C4C4, 0xFF4B4B4B),
                    ),
                    color: getSelectedColor(widget.colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    color: getSelectedColor(widget.colorTheme, 0xFFFEFEFE, 0xFF282A2C),
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

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.widget, required this.item});

  final ChainNameDropDown widget;
  final String item;

  @override
  Widget build(BuildContext context) {
    return Text(
      item,
      style: bodyMedium(context),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.widget,
  });

  final ChainNameDropDown widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Chain Name',
      style: bodyMedium(context),
    );
  }
}
