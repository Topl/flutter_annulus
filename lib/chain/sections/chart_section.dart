import 'package:flutter/material.dart';

import 'chart_options_dropdown.dart';
import 'line_graph.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const chartTimeShortcuts = [
      '24H',
      '1W',
      '2W',
      '1M',
      '3M',
      '6M',
      '1Y',
      'ALL',
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.bottomLeft, end: Alignment.bottomRight, colors: [Color(0xFF220862), Color(0xFF7040EC)]),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ChartOptionsDropdown(),
          const SizedBox(
            height: 40.0,
          ),
          const Expanded(
            child: LineGraph(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: chartTimeShortcuts
                .map(
                  (e) => ChartTabItem(
                    clicked: e == '24H',
                    text: e,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

class ChartTabItem extends StatelessWidget {
  const ChartTabItem({
    super.key,
    this.clicked = false,
    this.text,
  });

  final bool clicked;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 17),
      width: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
            clicked ? const Color(0xFF7040EC) : Colors.transparent,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
          ),
        ),
        onPressed: null,
        child: Text(
          text.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
