import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/models/chart_option.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:flutter_annulus/chain/models/time_frame.dart';
import 'package:flutter_annulus/chain/providers/chart_providers/average_block_time_provider.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chartOptionProvider = StateNotifierProvider<ChartOptionNotifier, ChartOption>((ref) {
  return ChartOptionNotifier();
});

class ChartOptionNotifier extends StateNotifier<ChartOption> {
  ChartOptionNotifier() : super(ChartOption.averageBlockTime);

  void changeChartOption(String value) {
    state = ChartOption.values.firstWhere((element) => element.name == value);
  }
}

final timeFrameProvider = StateNotifierProvider<TimeFrameNotifier, TimeFrame>((ref) {
  return TimeFrameNotifier();
});

class TimeFrameNotifier extends StateNotifier<TimeFrame> {
  TimeFrameNotifier() : super(TimeFrame.day);

  void changeTimeFrame(String value) {
    state = TimeFrame.values.firstWhere((element) => element.name.toUpperCase() == value);
  }
}

final chartProvider = StateNotifierProvider<ChartNotifier, AsyncValue<ChartResult>>((ref) {
  final TimeFrame timeFrame = ref.watch(timeFrameProvider);
  final ChartOption chartOption = ref.watch(chartOptionProvider);
  final Chains selectedChain = ref.watch(selectedChainProvider);

  return ChartNotifier(
    timeFrame: timeFrame,
    chartOption: chartOption,
    selectedChain: selectedChain,
    ref: ref,
  );
});

class ChartNotifier extends StateNotifier<AsyncValue<ChartResult>> {
  final TimeFrame timeFrame;
  final ChartOption chartOption;
  final Ref ref;
  final Chains selectedChain;

  ChartNotifier({
    required this.timeFrame,
    required this.chartOption,
    required this.ref,
    required this.selectedChain,
  }) : super(const AsyncLoading()) {
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    if (selectedChain == Chains.mock) {
      state = AsyncData(_mockChartData(timeFrame: timeFrame));
    } else {
      try {
        switch (chartOption) {
          case ChartOption.averageBlockTime:
            state = AsyncData(await _loadAverageBlockTime());
            print('QQQQ state: $state');
            break;
          case ChartOption.averageTransactionFee:
            state = AsyncData(await _loadAverageTransactionFee());
            break;
          case ChartOption.dataThroughput:
            state = AsyncData(await _loadDataThroughput());
            break;
        }
      } catch (e) {
        state = AsyncError(e, StackTrace.current);
      }
    }
  }

  Future<ChartResult> _loadAverageBlockTime() async {
    switch (timeFrame) {
      case TimeFrame.day:
        return ref.watch(averageBlockTimeDayProvider.future);
      case TimeFrame.week:
        return ref.watch(averageBlockTimeWeekProvider.future);

      case TimeFrame.twoWeeks:
        return ref.watch(averageBlockTimeTwoWeeksProvider.future);

      case TimeFrame.month:
        return ref.watch(averageBlockTimeMonthProvider.future);

      case TimeFrame.threeMonths:
        return ref.watch(averageBlockTimeThreeMonthsProvider.future);

      case TimeFrame.sixMonths:
        return ref.watch(averageBlockTimeSixMonthsProvider.future);

      case TimeFrame.year:
        return ref.watch(averageBlockTimeYearProvider.future);

      case TimeFrame.all:
        return ref.watch(averageBlockTimeAllTimeProvider.future);
    }
  }

  Future<ChartResult> _loadAverageTransactionFee() {
    switch (timeFrame) {
      case TimeFrame.day:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.week:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.twoWeeks:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.month:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.threeMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.sixMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.year:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.all:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
    }
  }

  Future<ChartResult> _loadDataThroughput() {
    switch (timeFrame) {
      case TimeFrame.day:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.week:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.twoWeeks:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.month:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.threeMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.sixMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.year:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
      case TimeFrame.all:
        return Future.delayed(const Duration(seconds: 1), () {
          return _mockChartData(timeFrame: timeFrame);
        });
    }
  }
}

/// Generates mock chart data based on the specified [timeFrame].
///
/// Returns a [ChartResult] object containing the generated chart data.
ChartResult _mockChartData({
  required TimeFrame timeFrame,
}) {
  // Define the number of data points
  const int dataPoints = 100;

  // Initialize a random number generator
  final random = Random();

  // Helper function to generate a random integer within a range
  int next(int min, int max) => min + random.nextInt(max - min);

  // Generate random values for the y-axis
  List<int> yAxisResults = List.generate(dataPoints, (index) => next(0, 500000));

  // Get the current date and time
  final currentDate = DateTime.now();

  // Calculate the start date based on the given time frame
  final startDate = currentDate.subtract(timeFrameToDuration(timeFrame));

  // Calculate the time difference between the start and end dates
  final timeDifference = DateTimeRange(start: startDate, end: currentDate);

  // Calculate the ratio of time difference to data points
  final differenceRatio = timeDifference.duration.inMinutes / dataPoints;

  // Generate the x-axis results by adding minutes based on the difference ratio
  final xAxisResults = List.generate(
    dataPoints,
    (index) => startDate.add(Duration(minutes: (index * differenceRatio).round())),
  );

  // Create a map of x-axis and y-axis results
  final results = Map<DateTime, int>.fromIterables(xAxisResults, yAxisResults);

  // Return the chart result
  return ChartResult(results: results);
}

/// Converts a [TimeFrame] enum value to the corresponding [Duration].
///
/// Returns the [Duration] based on the specified [timeFrame].
/// Throws an [ArgumentError] if an invalid [TimeFrame] is provided.
///
/// Example:
/// ```dart
/// final duration = timeFrameToDuration(TimeFrame.month);
/// print(duration); // Output: 30 days, 0:00:00
/// ```
Duration timeFrameToDuration(TimeFrame timeFrame) {
  switch (timeFrame) {
    case TimeFrame.day:
      return const Duration(hours: 24);
    case TimeFrame.week:
      return const Duration(days: 7);
    case TimeFrame.twoWeeks:
      return const Duration(days: 14);
    case TimeFrame.month:
      return const Duration(days: 30);
    case TimeFrame.threeMonths:
      return const Duration(days: 90);
    case TimeFrame.sixMonths:
      return const Duration(days: 180);
    case TimeFrame.year:
      return const Duration(days: 365);
    case TimeFrame.all:
      return const Duration(days: 365 * 5);
    default:
      throw ArgumentError('Invalid time frame');
  }
}
