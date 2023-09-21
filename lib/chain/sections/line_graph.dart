import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import "dart:math";

import '../providers/chart_provider.dart';

class LineGraph extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockData = ref.watch(blockProvider);
    return blockData.when(
      data: (data) {
        return ref.watch(chartProvider).when(
              data: (chart) {
                return LineGraphContainer(chartData: chart, blockData: data);
              },
              error: (error, stack) => const Text('Oops, something unexpected happened'),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
      },
      error: (error, stack) {
        return const Text('Oops, something unexpected happened');
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class LineGraphContainer extends HookConsumerWidget {
  const LineGraphContainer({
    Key? key,
    required this.chartData,
    required this.blockData,
  }) : super(key: key);

  final ChartResult chartData;
  final blockData;

  @override
  Widget build(BuildContext context, ref) {
    final selectedTimeFrame = ref.watch(timeFrameProvider);
    double calculateSpacing(int desiredDataPoints, double averageBlockTime) {
      final timeFrameInSeconds = timeFrameToDuration(selectedTimeFrame).inSeconds;
      return timeFrameInSeconds / desiredDataPoints / averageBlockTime;
    }

    return Consumer(
      builder: (context, watch, child) {
        final blockData = ref.watch(blockProvider);

        return blockData.when(
          data: (blocks) {
            final pointList = chartData.results.entries
                .map((e) => FlSpot(e.key.millisecondsSinceEpoch.toDouble(), e.value.toDouble()))
                .toList();

            var maxYValue =
                chartData.results.entries.map((e) => e.value.toDouble()).toList().reduce(max).ceilToDouble();
            if (maxYValue == 0) {
              maxYValue = 1;
            }

            final maxXValue = chartData.results.entries
                .map((e) => e.key.millisecondsSinceEpoch.toDouble())
                .toList()
                .reduce(max)
                .toDouble();

            final minXValue = chartData.results.entries
                .map((e) => e.key.millisecondsSinceEpoch.toDouble())
                .toList()
                .reduce(min)
                .toDouble();

            return LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: pointList,
                    isCurved: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(13, 200, 212, 0.48),
                          Color.fromRGBO(13, 200, 212, 0),
                        ],
                      ),
                    ),
                  ),
                ],
                gridData: FlGridData(
                  show: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: minXValue,
                maxX: maxXValue,
                minY: 0,
                maxY: maxYValue,
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: maxYValue / 5,
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 40,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: bottomTitleWidgets,
                      interval: calculateSpacing(100, selectedTimeFrame as double),
                    ),
                  ),
                ),
              ),
              swapAnimationDuration: const Duration(milliseconds: 150),
              swapAnimationCurve: Curves.ease,
            );
          },
          error: (error, stack) {
            return const Text('Oops, something unexpected happened');
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontFamily: 'Rational Display',
    fontSize: 14,
    color: Colors.white,
    letterSpacing: -0.2,
  );

  return Text(NumberFormat.compact().format(value).toString(), style: style, textAlign: TextAlign.left);
}

// Displays the timeline axis
Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontFamily: 'Rational Display',
    fontSize: 14,
    color: Colors.white,
    letterSpacing: -0.2,
  );
  if (value == meta.min || value == meta.max) {
    return const SizedBox();
  }
  final dateFormat = DateFormat('d/MM');
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(value.toInt());

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(dateFormat.format(date).toString(), style: style),
  );
}
