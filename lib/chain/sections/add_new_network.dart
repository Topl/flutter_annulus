import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../shared/providers/app_theme_provider.dart';
import '../models/currency.dart';

/// A widget that displays a dropdown button for selecting a chain name.
class AddNewNetworkContainer extends StatefulWidget {
  const AddNewNetworkContainer({Key? key, required this.colorTheme})
      : super(key: key);
  final ColorMode colorTheme;
  @override
  _AddNewNetworkState createState() => _AddNewNetworkState();
}

class _AddNewNetworkState extends State<AddNewNetworkContainer> {
  /// isCDropDownOpen is used to check if the dropdown is open or not
  bool isCDropDownOpen = false;

  /// validate is used to validate the input field
  bool validate = false;

  /// selectedCurrencyValue is used to store the selected value from the dropdown
  String? selectedCurrencyValue = 'LVL';

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.colorTheme == ColorMode.light
              ? const Color(0xFFFFFFFF)
              : const Color(0xFF282A2C)),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Network',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Rational Display',
                  color: widget.colorTheme == ColorMode.light
                      ? const Color(0xFF282A2C)
                      : const Color(0xFF858E8E),
                )),
            const SizedBox(
              height: 48,
            ),
            Container(
              height: 64,
              width: 560,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(112, 64, 236, 0.04),
                border: Border.all(
                  color: widget.colorTheme == ColorMode.light
                      ? const Color(0xFFE0E0E0)
                      : const Color(0xFF858E8E),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Icon(
                    Icons.warning_amber,
                    color: widget.colorTheme == ColorMode.light
                        ? const Color(0xFF7040EC)
                        : const Color(0xFF858E8E),
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 450,
                    child: Text(
                        'Some network providers may monitor your network activity. Please add only trusted networks.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Rational Display',
                          fontWeight: FontWeight.w300,
                          color: widget.colorTheme == ColorMode.light
                              ? const Color(0xFF7040EC)
                              : const Color(0xFF858E8E),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              controller: TextEditingController(text: 'Topl Mainnet'),
              enabled: false,
              style: customTextFieldStyle(),
              decoration: InputDecoration(
                labelText: 'Network Name',
                labelStyle: customTextStyle(),
                border: customOutlineInputBorder(),
                enabledBorder: customOutlineInputBorder(),
                focusedBorder: customOutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: textEditingController,
              style: customTextFieldStyle(),
              decoration: InputDecoration(
                labelText: 'New RPC URL',
                labelStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rational Display',
                    color: Color(0xFF858E8E)),
                border: customOutlineInputBorder(),
                enabledBorder: customOutlineInputBorder(),
                focusedBorder: customOutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    validate ? "This field is required" : '',
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Rational Display',
                        color: Color(0xFFF07575)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: TextEditingController(text: '192.158.0.0'),
              style: customTextFieldStyle(),
              decoration: InputDecoration(
                labelText: 'Chain ID',
                suffixIcon: Tooltip(
                  message:
                      'The Chain ID is a unique identifier for the network.',
                  showDuration: const Duration(seconds: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.9),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: Color(0xFF858E8E),
                  ),
                ),
                labelStyle: customTextStyle(),
                border: customOutlineInputBorder(),
                enabledBorder: customOutlineInputBorder(),
                focusedBorder: customOutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            DropdownButton2(
              hint: const Text(
                'Select a Network',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Rational Display',
                  color: Color(0xFF858E8E),
                ),
              ),
              style: customTextStyle(),
              underline: Container(
                height: 0,
              ),
              buttonStyleData: ButtonStyleData(
                height: 56,
                width: 560,
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
                icon: isCDropDownOpen
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
              value: selectedCurrencyValue,
              // Array list of items
              items: currencies.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCurrencyValue = value as String;
                });
              },
              onMenuStateChange: (isOpen) {
                setState(() {
                  isCDropDownOpen = !isCDropDownOpen;
                });
              },
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: TextEditingController(text: ''),
              style: customTextFieldStyle(),
              decoration: InputDecoration(
                hintText: 'Block Explorer URL (Optional)',
                hintStyle: customTextStyle(),
                border: customOutlineInputBorder(),
                enabledBorder: customOutlineInputBorder(),
                focusedBorder: customOutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 272,
                    height: 56,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Rational Display',
                            color: Color(0xFF858E8E),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 272,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          textEditingController.text.isEmpty
                              ? validate = true
                              : validate = false;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF0DC8D4)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: const Text('Add',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Rational Display',
                            color: Color(0xFFFEFEFE),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle customTextFieldStyle() {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'Rational Display',
      color: customColor(),
    );
  }

  Color customColor() {
    return widget.colorTheme == ColorMode.light
        ? const Color(0xFF535757)
        : const Color(0xFF858E8E);
  }

  TextStyle customTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontFamily: 'Rational Display',
      color: Color(0xFF858E8E),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: outlineBorder(),
    );
  }

  BorderSide outlineBorder() {
    return BorderSide(
      color: widget.colorTheme == ColorMode.light
          ? const Color(0xFFC0C4C4)
          : const Color(0xFF858E8E),
    );
  }
}
