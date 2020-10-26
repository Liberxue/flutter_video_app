///
//  Generated code. Do not modify.
//  source: proto/favorite.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pbenum.dart' as $4;

class FavoriteActionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteActionRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'ResourceID', protoName: 'ResourceID')
    ..aOS(2, 'Userid', protoName: 'Userid')
    ..aOB(3, 'IsFavorite', protoName: 'IsFavorite')
    ..hasRequiredFields = false
  ;

  FavoriteActionRequest._() : super();
  factory FavoriteActionRequest() => create();
  factory FavoriteActionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteActionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteActionRequest clone() => FavoriteActionRequest()..mergeFromMessage(this);
  FavoriteActionRequest copyWith(void Function(FavoriteActionRequest) updates) => super.copyWith((message) => updates(message as FavoriteActionRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteActionResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  FavoriteActionResponse._() : super();
  factory FavoriteActionResponse() => create();
  factory FavoriteActionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteActionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteActionResponse clone() => FavoriteActionResponse()..mergeFromMessage(this);
  FavoriteActionResponse copyWith(void Function(FavoriteActionResponse) updates) => super.copyWith((message) => updates(message as FavoriteActionResponse));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteList', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'ResourceId', protoName: 'ResourceId')
    ..aInt64(2, 'CreateTime', protoName: 'CreateTime')
    ..aOS(3, 'UserId', protoName: 'UserId')
    ..e<$4.ResourceType>(4, 'ResourceType', $pb.PbFieldType.OE, protoName: 'ResourceType', defaultOrMaker: $4.ResourceType.videoSearch, valueOf: $4.ResourceType.valueOf, enumValues: $4.ResourceType.values)
    ..hasRequiredFields = false
  ;

  FavoriteList._() : super();
  factory FavoriteList() => create();
  factory FavoriteList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteList clone() => FavoriteList()..mergeFromMessage(this);
  FavoriteList copyWith(void Function(FavoriteList) updates) => super.copyWith((message) => updates(message as FavoriteList));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteListRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pc<FavoriteList>(1, 'FavoriteList', $pb.PbFieldType.PM, protoName: 'FavoriteList', subBuilder: FavoriteList.create)
    ..hasRequiredFields = false
  ;

  FavoriteListRequest._() : super();
  factory FavoriteListRequest() => create();
  factory FavoriteListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteListRequest clone() => FavoriteListRequest()..mergeFromMessage(this);
  FavoriteListRequest copyWith(void Function(FavoriteListRequest) updates) => super.copyWith((message) => updates(message as FavoriteListRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteListResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..pc<FavoriteList>(3, 'Data', $pb.PbFieldType.PM, protoName: 'Data', subBuilder: FavoriteList.create)
    ..hasRequiredFields = false
  ;

  FavoriteListResponse._() : super();
  factory FavoriteListResponse() => create();
  factory FavoriteListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteListResponse clone() => FavoriteListResponse()..mergeFromMessage(this);
  FavoriteListResponse copyWith(void Function(FavoriteListResponse) updates) => super.copyWith((message) => updates(message as FavoriteListResponse));
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

