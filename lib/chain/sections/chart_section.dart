import 'package:flutter/material.dart';

import 'chart_options_dropdown.dart';
import 'line_graph.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF220862), Color(0xFF7040EC)]),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChartOptionsDropdown(),
          SizedBox(
            height: 40.0,
          ),
          Expanded(
            child: LineGraph(),
          ),
        ],
      ),
    );
  }
}
