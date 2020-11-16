///
//  Generated code. Do not modify.
//  source: proto/favorite.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pbenum.dart' as $4;

class FavoriteActionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteActionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResourceID', protoName: 'ResourceID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Userid', protoName: 'Userid')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'IsFavorite', protoName: 'IsFavorite')
    ..hasRequiredFields = false
  ;

  FavoriteActionRequest._() : super();
  factory FavoriteActionRequest() => create();
  factory FavoriteActionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteActionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteActionRequest clone() => FavoriteActionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteActionRequest copyWith(void Function(FavoriteActionRequest) updates) => super.copyWith((message) => updates(message as FavoriteActionRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteActionRequest create() => FavoriteActionRequest._();
  FavoriteActionRequest createEmptyInstance() => create();
  static $pb.PbList<FavoriteActionRequest> createRepeated() => $pb.PbList<FavoriteActionRequest>();
  @$core.pragma('dart2js:noInline')
  static FavoriteActionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteActionRequest>(create);
  static FavoriteActionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resourceID => $_getSZ(0);
  @$pb.TagNumber(1)
  set resourceID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResourceID() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userid => $_getSZ(1);
  @$pb.TagNumber(2)
  set userid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserid() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isFavorite => $_getBF(2);
  @$pb.TagNumber(3)
  set isFavorite($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsFavorite() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsFavorite() => clearField(3);
}

class FavoriteActionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteActionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  FavoriteActionResponse._() : super();
  factory FavoriteActionResponse() => create();
  factory FavoriteActionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteActionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteActionResponse clone() => FavoriteActionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteActionResponse copyWith(void Function(FavoriteActionResponse) updates) => super.copyWith((message) => updates(message as FavoriteActionResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteActionResponse create() => FavoriteActionResponse._();
  FavoriteActionResponse createEmptyInstance() => create();
  static $pb.PbList<FavoriteActionResponse> createRepeated() => $pb.PbList<FavoriteActionResponse>();
  @$core.pragma('dart2js:noInline')
  static FavoriteActionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteActionResponse>(create);
  static FavoriteActionResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $4.ResponseCode get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($4.ResponseCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class FavoriteList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResourceId', protoName: 'ResourceId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CreateTime', protoName: 'CreateTime')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UserId', protoName: 'UserId')
    ..e<$4.ResourceType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResourceType', $pb.PbFieldType.OE, protoName: 'ResourceType', defaultOrMaker: $4.ResourceType.videoSearch, valueOf: $4.ResourceType.valueOf, enumValues: $4.ResourceType.values)
    ..hasRequiredFields = false
  ;

  FavoriteList._() : super();
  factory FavoriteList() => create();
  factory FavoriteList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteList clone() => FavoriteList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteList copyWith(void Function(FavoriteList) updates) => super.copyWith((message) => updates(message as FavoriteList)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteList create() => FavoriteList._();
  FavoriteList createEmptyInstance() => create();
  static $pb.PbList<FavoriteList> createRepeated() => $pb.PbList<FavoriteList>();
  @$core.pragma('dart2js:noInline')
  static FavoriteList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteList>(create);
  static FavoriteList _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resourceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set resourceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResourceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createTime => $_getI64(1);
  @$pb.TagNumber(2)
  set createTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $4.ResourceType get resourceType => $_getN(3);
  @$pb.TagNumber(4)
  set resourceType($4.ResourceType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasResourceType() => $_has(3);
  @$pb.TagNumber(4)
  void clearResourceType() => clearField(4);
}

class FavoriteListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..pc<FavoriteList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'FavoriteList', $pb.PbFieldType.PM, protoName: 'FavoriteList', subBuilder: FavoriteList.create)
    ..hasRequiredFields = false
  ;

  FavoriteListRequest._() : super();
  factory FavoriteListRequest() => create();
  factory FavoriteListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteListRequest clone() => FavoriteListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteListRequest copyWith(void Function(FavoriteListRequest) updates) => super.copyWith((message) => updates(message as FavoriteListRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteListRequest create() => FavoriteListRequest._();
  FavoriteListRequest createEmptyInstance() => create();
  static $pb.PbList<FavoriteListRequest> createRepeated() => $pb.PbList<FavoriteListRequest>();
  @$core.pragma('dart2js:noInline')
  static FavoriteListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteListRequest>(create);
  static FavoriteListRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FavoriteList> get favoriteList => $_getList(0);
}

class FavoriteListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..pc<FavoriteList>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Data', $pb.PbFieldType.PM, protoName: 'Data', subBuilder: FavoriteList.create)
    ..hasRequiredFields = false
  ;

  FavoriteListResponse._() : super();
  factory FavoriteListResponse() => create();
  factory FavoriteListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteListResponse clone() => FavoriteListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteListResponse copyWith(void Function(FavoriteListResponse) updates) => super.copyWith((message) => updates(message as FavoriteListResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteListResponse create() => FavoriteListResponse._();
  FavoriteListResponse createEmptyInstance() => create();
  static $pb.PbList<FavoriteListResponse> createRepeated() => $pb.PbList<FavoriteListResponse>();
  @$core.pragma('dart2js:noInline')
  static FavoriteListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteListResponse>(create);
  static FavoriteListResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $4.ResponseCode get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($4.ResponseCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<FavoriteList> get data => $_getList(2);
}

