///
//  Generated code. Do not modify.
//  source: proto/resourceManager.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class FavoriteType extends $pb.ProtobufEnum {
  static const FavoriteType Confirm = FavoriteType._(0, 'Confirm');
  static const FavoriteType Cancel = FavoriteType._(1, 'Cancel');

  static const $core.List<FavoriteType> values = <FavoriteType> [
    Confirm,
    Cancel,
  ];

  static final $core.Map<$core.int, FavoriteType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FavoriteType valueOf($core.int value) => _byValue[value];

  const FavoriteType._($core.int v, $core.String n) : super(v, n);
}

