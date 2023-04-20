///
//  Generated code. Do not modify.
//  source: brambl/models/address.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use addressDescriptor instead')
const Address$json = const {
  '1': 'Address',
  '2': const [
    const {'1': 'network', '3': 1, '4': 1, '5': 13, '10': 'network'},
    const {'1': 'ledger', '3': 2, '4': 1, '5': 13, '10': 'ledger'},
    const {'1': 'index', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.UInt32Value', '10': 'index'},
    const {'1': 'id', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier', '8': const {}, '10': 'id'},
  ],
};

/// Descriptor for `Address`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressDescriptor = $convert.base64Decode('CgdBZGRyZXNzEhgKB25ldHdvcmsYASABKA1SB25ldHdvcmsSFgoGbGVkZ2VyGAIgASgNUgZsZWRnZXISMgoFaW5kZXgYAyABKAsyHC5nb29nbGUucHJvdG9idWYuVUludDMyVmFsdWVSBWluZGV4EjsKAmlkGAQgASgLMiEuY28udG9wbC5icmFtYmwubW9kZWxzLklkZW50aWZpZXJCCPpCBYoBAhABUgJpZA==');
@$core.Deprecated('Use lockAddressDescriptor instead')
const LockAddress$json = const {
  '1': 'LockAddress',
  '2': const [
    const {'1': 'network', '3': 1, '4': 1, '5': 13, '10': 'network'},
    const {'1': 'ledger', '3': 2, '4': 1, '5': 13, '10': 'ledger'},
    const {'1': 'lock32', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.Lock32', '9': 0, '10': 'lock32'},
    const {'1': 'lock64', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.Lock64', '9': 0, '10': 'lock64'},
  ],
  '8': const [
    const {'1': 'id'},
  ],
};

/// Descriptor for `LockAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lockAddressDescriptor = $convert.base64Decode('CgtMb2NrQWRkcmVzcxIYCgduZXR3b3JrGAEgASgNUgduZXR3b3JrEhYKBmxlZGdlchgCIAEoDVIGbGVkZ2VyEkIKBmxvY2szMhgDIAEoCzIoLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5JZGVudGlmaWVyLkxvY2szMkgAUgZsb2NrMzISQgoGbG9jazY0GAQgASgLMiguY28udG9wbC5icmFtYmwubW9kZWxzLklkZW50aWZpZXIuTG9jazY0SABSBmxvY2s2NEIECgJpZA==');
@$core.Deprecated('Use transactionOutputAddressDescriptor instead')
const TransactionOutputAddress$json = const {
  '1': 'TransactionOutputAddress',
  '2': const [
    const {'1': 'network', '3': 1, '4': 1, '5': 13, '10': 'network'},
    const {'1': 'ledger', '3': 2, '4': 1, '5': 13, '10': 'ledger'},
    const {'1': 'index', '3': 3, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'ioTransaction32', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction32', '9': 0, '10': 'ioTransaction32'},
    const {'1': 'ioTransaction64', '3': 5, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction64', '9': 0, '10': 'ioTransaction64'},
  ],
  '8': const [
    const {'1': 'id'},
  ],
};

/// Descriptor for `TransactionOutputAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionOutputAddressDescriptor = $convert.base64Decode('ChhUcmFuc2FjdGlvbk91dHB1dEFkZHJlc3MSGAoHbmV0d29yaxgBIAEoDVIHbmV0d29yaxIWCgZsZWRnZXIYAiABKA1SBmxlZGdlchIUCgVpbmRleBgDIAEoDVIFaW5kZXgSXQoPaW9UcmFuc2FjdGlvbjMyGAQgASgLMjEuY28udG9wbC5icmFtYmwubW9kZWxzLklkZW50aWZpZXIuSW9UcmFuc2FjdGlvbjMySABSD2lvVHJhbnNhY3Rpb24zMhJdCg9pb1RyYW5zYWN0aW9uNjQYBSABKAsyMS5jby50b3BsLmJyYW1ibC5tb2RlbHMuSWRlbnRpZmllci5Jb1RyYW5zYWN0aW9uNjRIAFIPaW9UcmFuc2FjdGlvbjY0QgQKAmlk');
@$core.Deprecated('Use transactionInputAddressDescriptor instead')
const TransactionInputAddress$json = const {
  '1': 'TransactionInputAddress',
  '2': const [
    const {'1': 'network', '3': 1, '4': 1, '5': 13, '10': 'network'},
    const {'1': 'ledger', '3': 2, '4': 1, '5': 13, '10': 'ledger'},
    const {'1': 'index', '3': 3, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'ioTransaction32', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction32', '9': 0, '10': 'ioTransaction32'},
    const {'1': 'ioTransaction64', '3': 5, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction64', '9': 0, '10': 'ioTransaction64'},
  ],
  '8': const [
    const {'1': 'id'},
  ],
};

/// Descriptor for `TransactionInputAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInputAddressDescriptor = $convert.base64Decode('ChdUcmFuc2FjdGlvbklucHV0QWRkcmVzcxIYCgduZXR3b3JrGAEgASgNUgduZXR3b3JrEhYKBmxlZGdlchgCIAEoDVIGbGVkZ2VyEhQKBWluZGV4GAMgASgNUgVpbmRleBJdCg9pb1RyYW5zYWN0aW9uMzIYBCABKAsyMS5jby50b3BsLmJyYW1ibC5tb2RlbHMuSWRlbnRpZmllci5Jb1RyYW5zYWN0aW9uMzJIAFIPaW9UcmFuc2FjdGlvbjMyEl0KD2lvVHJhbnNhY3Rpb242NBgFIAEoCzIxLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5JZGVudGlmaWVyLklvVHJhbnNhY3Rpb242NEgAUg9pb1RyYW5zYWN0aW9uNjRCBAoCaWQ=');
