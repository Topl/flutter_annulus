import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chart_result.freezed.dart';

@freezed
class ChartResult with _$ChartResult {
  const factory ChartResult({
    required Map<DateTime, int> results,
  }) = _ChartResult;
}
