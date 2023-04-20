///
//  Generated code. Do not modify.
//  source: brambl/models/transaction/spent_transaction_output.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use spentTransactionOutputDescriptor instead')
const SpentTransactionOutput$json = const {
  '1': 'SpentTransactionOutput',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.TransactionOutputAddress', '8': const {}, '10': 'address'},
    const {'1': 'attestation', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Attestation', '8': const {}, '10': 'attestation'},
    const {'1': 'value', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Value', '8': const {}, '10': 'value'},
  ],
};

/// Descriptor for `SpentTransactionOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spentTransactionOutputDescriptor = $convert.base64Decode('ChZTcGVudFRyYW5zYWN0aW9uT3V0cHV0ElMKB2FkZHJlc3MYASABKAsyLy5jby50b3BsLmJyYW1ibC5tb2RlbHMuVHJhbnNhY3Rpb25PdXRwdXRBZGRyZXNzQgj6QgWKAQIQAVIHYWRkcmVzcxJSCgthdHRlc3RhdGlvbhgCIAEoCzImLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guQXR0ZXN0YXRpb25CCPpCBYoBAhABUgthdHRlc3RhdGlvbhJACgV2YWx1ZRgDIAEoCzIgLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guVmFsdWVCCPpCBYoBAhABUgV2YWx1ZQ==');
