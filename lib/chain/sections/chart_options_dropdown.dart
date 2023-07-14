import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_annulus/chain/models/chart_option.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/chart_provider.dart';

class ChartOptionsDropdown extends HookConsumerWidget {
  final List<String> chartOptions = ChartOption.values.map((e) => e.name).toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOption = ref.watch(chartOptionProvider).name;

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
          value: selectedOption,
          onChanged: (value) {
            ref.read(chartOptionProvider.notifier).changeChartOption(value!);
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
