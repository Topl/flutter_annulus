import 'package:flutter_annulus/chain/models/chart_option.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chartOptionProvider = StateProvider<ChartOption>((ref) {
  return ChartOption.averageBlockTime;
});

final timeFrameProvider = StateProvider<TimeFrame>((ref) {
  return TimeFrame.day;
});

final chartProvider = StateNotifierProvider<ChartNotifier, AsyncValue<ChartResult>>((ref) {
  final TimeFrame timeFrame = ref.watch(timeFrameProvider);
  final ChartOption chartOption = ref.watch(chartOptionProvider);
  return ChartNotifier(
    timeFrame: timeFrame,
    chartOption: chartOption,
  );
});

class ChartNotifier extends StateNotifier<AsyncValue<ChartResult>> {
  final TimeFrame timeFrame;
  final ChartOption chartOption;
  ChartNotifier({
    required this.timeFrame,
    required this.chartOption,
  }) : super(const AsyncLoading()) {
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    try {
      switch (chartOption) {
        case ChartOption.averageBlockTime:
          state = AsyncData(await _loadAverageBlockTime());
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

  Future<ChartResult> _loadAverageBlockTime() async {
    switch (timeFrame) {
      case TimeFrame.day:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.week:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.twoWeeks:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.month:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.threeMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.sixMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.year:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.all:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
    }
  }

  Future<ChartResult> _loadAverageTransactionFee() {
    switch (timeFrame) {
      case TimeFrame.day:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.week:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.twoWeeks:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.month:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.threeMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.sixMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.year:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.all:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
    }
  }

  Future<ChartResult> _loadDataThroughput() {
    switch (timeFrame) {
      case TimeFrame.day:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.week:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.twoWeeks:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.month:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.threeMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.sixMonths:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.year:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
      case TimeFrame.all:
        return Future.delayed(const Duration(seconds: 1), () {
          return const ChartResult(results: {});
        });
    }
  }
}
