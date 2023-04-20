///
//  Generated code. Do not modify.
//  source: brambl/models/transaction/io_transaction.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use ioTransactionDescriptor instead')
const IoTransaction$json = const {
  '1': 'IoTransaction',
  '2': const [
    const {'1': 'inputs', '3': 1, '4': 3, '5': 11, '6': '.co.topl.brambl.models.transaction.SpentTransactionOutput', '10': 'inputs'},
    const {'1': 'outputs', '3': 2, '4': 3, '5': 11, '6': '.co.topl.brambl.models.transaction.UnspentTransactionOutput', '10': 'outputs'},
    const {'1': 'datum', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Datum.IoTransaction', '8': const {}, '10': 'datum'},
  ],
};

/// Descriptor for `IoTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ioTransactionDescriptor = $convert.base64Decode('Cg1Jb1RyYW5zYWN0aW9uElEKBmlucHV0cxgBIAMoCzI5LmNvLnRvcGwuYnJhbWJsLm1vZGVscy50cmFuc2FjdGlvbi5TcGVudFRyYW5zYWN0aW9uT3V0cHV0UgZpbnB1dHMSVQoHb3V0cHV0cxgCIAMoCzI7LmNvLnRvcGwuYnJhbWJsLm1vZGVscy50cmFuc2FjdGlvbi5VbnNwZW50VHJhbnNhY3Rpb25PdXRwdXRSB291dHB1dHMSSgoFZGF0dW0YAyABKAsyKi5jby50b3BsLmJyYW1ibC5tb2RlbHMuRGF0dW0uSW9UcmFuc2FjdGlvbkII+kIFigECEAFSBWRhdHVt');
