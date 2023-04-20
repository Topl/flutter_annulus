///
//  Generated code. Do not modify.
//  source: brambl/models/box/lock.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use lockDescriptor instead')
const Lock$json = const {
  '1': 'Lock',
  '2': const [
    const {'1': 'predicate', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Predicate', '9': 0, '10': 'predicate'},
    const {'1': 'image32', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Image32', '9': 0, '10': 'image32'},
    const {'1': 'image64', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Image64', '9': 0, '10': 'image64'},
    const {'1': 'commitment32', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Commitment32', '9': 0, '10': 'commitment32'},
    const {'1': 'commitment64', '3': 5, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Commitment64', '9': 0, '10': 'commitment64'},
  ],
  '3': const [Lock_Predicate$json, Lock_Image32$json, Lock_Image64$json, Lock_Commitment32$json, Lock_Commitment64$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use lockDescriptor instead')
const Lock_Predicate$json = const {
  '1': 'Predicate',
  '2': const [
    const {'1': 'challenges', '3': 1, '4': 3, '5': 11, '6': '.co.topl.brambl.models.box.Challenge', '10': 'challenges'},
    const {'1': 'threshold', '3': 2, '4': 1, '5': 13, '10': 'threshold'},
  ],
};

@$core.Deprecated('Use lockDescriptor instead')
const Lock_Image32$json = const {
  '1': 'Image32',
  '2': const [
    const {'1': 'leaves', '3': 1, '4': 3, '5': 11, '6': '.co.topl.brambl.models.Identifier.Lock32', '10': 'leaves'},
    const {'1': 'threshold', '3': 2, '4': 1, '5': 13, '10': 'threshold'},
  ],
};

@$core.Deprecated('Use lockDescriptor instead')
const Lock_Image64$json = const {
  '1': 'Image64',
  '2': const [
    const {'1': 'leaves', '3': 1, '4': 3, '5': 11, '6': '.co.topl.brambl.models.Identifier.Lock64', '10': 'leaves'},
    const {'1': 'threshold', '3': 2, '4': 1, '5': 13, '10': 'threshold'},
  ],
};

@$core.Deprecated('Use lockDescriptor instead')
const Lock_Commitment32$json = const {
  '1': 'Commitment32',
  '2': const [
    const {'1': 'root', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.AccumulatorRoot32', '10': 'root'},
    const {'1': 'threshold', '3': 2, '4': 1, '5': 13, '10': 'threshold'},
  ],
};

@$core.Deprecated('Use lockDescriptor instead')
const Lock_Commitment64$json = const {
  '1': 'Commitment64',
  '2': const [
    const {'1': 'root', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.AccumulatorRoot64', '10': 'root'},
    const {'1': 'threshold', '3': 2, '4': 1, '5': 13, '10': 'threshold'},
  ],
};

/// Descriptor for `Lock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lockDescriptor = $convert.base64Decode('CgRMb2NrEkkKCXByZWRpY2F0ZRgBIAEoCzIpLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guTG9jay5QcmVkaWNhdGVIAFIJcHJlZGljYXRlEkMKB2ltYWdlMzIYAiABKAsyJy5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkxvY2suSW1hZ2UzMkgAUgdpbWFnZTMyEkMKB2ltYWdlNjQYAyABKAsyJy5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkxvY2suSW1hZ2U2NEgAUgdpbWFnZTY0ElIKDGNvbW1pdG1lbnQzMhgEIAEoCzIsLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guTG9jay5Db21taXRtZW50MzJIAFIMY29tbWl0bWVudDMyElIKDGNvbW1pdG1lbnQ2NBgFIAEoCzIsLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guTG9jay5Db21taXRtZW50NjRIAFIMY29tbWl0bWVudDY0Gm8KCVByZWRpY2F0ZRJECgpjaGFsbGVuZ2VzGAEgAygLMiQuY28udG9wbC5icmFtYmwubW9kZWxzLmJveC5DaGFsbGVuZ2VSCmNoYWxsZW5nZXMSHAoJdGhyZXNob2xkGAIgASgNUgl0aHJlc2hvbGQaaQoHSW1hZ2UzMhJACgZsZWF2ZXMYASADKAsyKC5jby50b3BsLmJyYW1ibC5tb2RlbHMuSWRlbnRpZmllci5Mb2NrMzJSBmxlYXZlcxIcCgl0aHJlc2hvbGQYAiABKA1SCXRocmVzaG9sZBppCgdJbWFnZTY0EkAKBmxlYXZlcxgBIAMoCzIoLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5JZGVudGlmaWVyLkxvY2s2NFIGbGVhdmVzEhwKCXRocmVzaG9sZBgCIAEoDVIJdGhyZXNob2xkGnUKDENvbW1pdG1lbnQzMhJHCgRyb290GAEgASgLMjMuY28udG9wbC5icmFtYmwubW9kZWxzLklkZW50aWZpZXIuQWNjdW11bGF0b3JSb290MzJSBHJvb3QSHAoJdGhyZXNob2xkGAIgASgNUgl0aHJlc2hvbGQadQoMQ29tbWl0bWVudDY0EkcKBHJvb3QYASABKAsyMy5jby50b3BsLmJyYW1ibC5tb2RlbHMuSWRlbnRpZmllci5BY2N1bXVsYXRvclJvb3Q2NFIEcm9vdBIcCgl0aHJlc2hvbGQYAiABKA1SCXRocmVzaG9sZEIHCgV2YWx1ZQ==');
