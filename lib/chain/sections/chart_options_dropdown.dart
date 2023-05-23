import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ChartOptionsDropdown extends StatefulWidget {
  const ChartOptionsDropdown({Key? key}) : super(key: key);

  @override
  State<ChartOptionsDropdown> createState() => _ChartOptionsDropdownState();
}

class _ChartOptionsDropdownState extends State<ChartOptionsDropdown> {
  final List<String> chartOptions = [
    'Average Transaction Fee',
  ];

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  chartOptions[0],
                  style: const TextStyle(
                    fontFamily: 'Rational Display',
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: -0.2,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: chartOptions
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontFamily: 'Rational Display',
                      fontSize: 14,
                      color: Colors.white,
                      letterSpacing: -0.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 45,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(40, 42, 44, 0.48),
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.expand_more_outlined,
            ),
            iconSize: 28,
            iconEnabledColor: Color(0xFFC0C4C4),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color.fromRGBO(40, 42, 44, 0.48),
            ),
            elevation: 1,
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
              thumbColor: MaterialStateProperty.all(
                const Color(0xFFC0C4C4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
