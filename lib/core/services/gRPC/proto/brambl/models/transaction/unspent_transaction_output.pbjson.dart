///
//  Generated code. Do not modify.
//  source: brambl/models/transaction/unspent_transaction_output.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use unspentTransactionOutputDescriptor instead')
const UnspentTransactionOutput$json = const {
  '1': 'UnspentTransactionOutput',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.LockAddress', '8': const {}, '10': 'address'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Value', '8': const {}, '10': 'value'},
  ],
};

/// Descriptor for `UnspentTransactionOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unspentTransactionOutputDescriptor = $convert.base64Decode('ChhVbnNwZW50VHJhbnNhY3Rpb25PdXRwdXQSRgoHYWRkcmVzcxgBIAEoCzIiLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5Mb2NrQWRkcmVzc0II+kIFigECEAFSB2FkZHJlc3MSQAoFdmFsdWUYAiABKAsyIC5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LlZhbHVlQgj6QgWKAQIQAVIFdmFsdWU=');
