///
//  Generated code. Do not modify.
//  source: proto/resourceManager.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'resourceManager.pbenum.dart';
import 'common.pbenum.dart' as $5;

export 'resourceManager.pbenum.dart';

class FavoriteResourceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteResourceRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'AccountId', protoName: 'AccountId')
    ..aOS(2, 'ResourceId', protoName: 'ResourceId')
    ..e<FavoriteType>(3, 'FavoriteType', $pb.PbFieldType.OE, protoName: 'FavoriteType', defaultOrMaker: FavoriteType.Confirm, valueOf: FavoriteType.valueOf, enumValues: FavoriteType.values)
    ..hasRequiredFields = false
  ;

  FavoriteResourceRequest._() : super();
  factory FavoriteResourceRequest() => create();
  factory FavoriteResourceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteResourceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteResourceRequest clone() => FavoriteResourceRequest()..mergeFromMessage(this);
  FavoriteResourceRequest copyWith(void Function(FavoriteResourceRequest) updates) => super.copyWith((message) => updates(message as FavoriteResourceRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteResourceRequest create() => FavoriteResourceRequest._();
  FavoriteResourceRequest createEmptyInstance() => create();
  static $pb.PbList<FavoriteResourceRequest> createRepeated() => $pb.PbList<FavoriteResourceRequest>();
  @$core.pragma('dart2js:noInline')
  static FavoriteResourceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteResourceRequest>(create);
  static FavoriteResourceRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resourceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set resourceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResourceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceId() => clearField(2);

  @$pb.TagNumber(3)
  FavoriteType get favoriteType => $_getN(2);
  @$pb.TagNumber(3)
  set favoriteType(FavoriteType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFavoriteType() => $_has(2);
  @$pb.TagNumber(3)
  void clearFavoriteType() => clearField(3);
}

class FavoriteResourceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteResourceResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  FavoriteResourceResponse._() : super();
  factory FavoriteResourceResponse() => create();
  factory FavoriteResourceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteResourceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteResourceResponse clone() => FavoriteResourceResponse()..mergeFromMessage(this);
  FavoriteResourceResponse copyWith(void Function(FavoriteResourceResponse) updates) => super.copyWith((message) => updates(message as FavoriteResourceResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteResourceResponse create() => FavoriteResourceResponse._();
  FavoriteResourceResponse createEmptyInstance() => create();
  static $pb.PbList<FavoriteResourceResponse> createRepeated() => $pb.PbList<FavoriteResourceResponse>();
  @$core.pragma('dart2js:noInline')
  static FavoriteResourceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteResourceResponse>(create);
  static FavoriteResourceResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $5.ResponseCode get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($5.ResponseCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

