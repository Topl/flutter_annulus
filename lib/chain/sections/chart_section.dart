import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/time_frame.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../providers/chart_provider.dart';
import 'chart_options_dropdown.dart';
import 'line_graph.dart';

class ChartSection extends ConsumerWidget {
  const ChartSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartTimeFrame = TimeFrame.values.map((e) => e.name.toUpperCase()).toList();
    final selectedTimeFrame = ref.watch(timeFrameProvider).name.toUpperCase();

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.bottomLeft, end: Alignment.bottomRight, colors: [Color(0xFF220862), Color(0xFF7040EC)]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChartOptionsDropdown(),
          const SizedBox(
            height: 40.0,
          ),
          Expanded(
            child: LineGraph(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: chartTimeFrame
                .map(
                  (e) => ChartTabItem(
                    clicked: e == selectedTimeFrame,
                    text: e,
                    onPressed: () {
                      ref.read(timeFrameProvider.notifier).changeTimeFrame(e);
                    },
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
    required this.onPressed,
  });

  final bool clicked;
  final String? text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            right: isMobile
                ? 1
                : isTablet
                    ? 18
                    : 17),
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
          onPressed: onPressed,
          child: Text(
            text.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
