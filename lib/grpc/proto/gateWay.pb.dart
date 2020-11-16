///
//  Generated code. Do not modify.
//  source: proto/gateWay.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'accountManager.pb.dart' as $0;

import 'common.pbenum.dart' as $4;

class SignInRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignInRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..e<$4.LoginType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'LoginType', $pb.PbFieldType.OE, protoName: 'LoginType', defaultOrMaker: $4.LoginType.ACCOUNT, valueOf: $4.LoginType.valueOf, enumValues: $4.LoginType.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'User', protoName: 'User')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PhoneNumber', protoName: 'PhoneNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PassWord', protoName: 'PassWord')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'DeviceType', protoName: 'DeviceType')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'DeviceVersion', protoName: 'DeviceVersion')
    ..hasRequiredFields = false
  ;

  SignInRequest._() : super();
  factory SignInRequest() => create();
  factory SignInRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignInRequest clone() => SignInRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignInRequest copyWith(void Function(SignInRequest) updates) => super.copyWith((message) => updates(message as SignInRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignInRequest create() => SignInRequest._();
  SignInRequest createEmptyInstance() => create();
  static $pb.PbList<SignInRequest> createRepeated() => $pb.PbList<SignInRequest>();
  @$core.pragma('dart2js:noInline')
  static SignInRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignInRequest>(create);
  static SignInRequest _defaultInstance;

  @$pb.TagNumber(1)
  $4.LoginType get loginType => $_getN(0);
  @$pb.TagNumber(1)
  set loginType($4.LoginType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLoginType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get user => $_getSZ(1);
  @$pb.TagNumber(2)
  set user($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get phoneNumber => $_getI64(2);
  @$pb.TagNumber(3)
  set phoneNumber($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPhoneNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhoneNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get passWord => $_getSZ(3);
  @$pb.TagNumber(4)
  set passWord($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassWord() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassWord() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceType => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceType() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get deviceVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set deviceVersion($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeviceVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceVersion() => clearField(6);
}

class SignInResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignInResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Token', protoName: 'Token')
    ..aOM<$0.AccountResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Data', protoName: 'Data', subBuilder: $0.AccountResponse.create)
    ..hasRequiredFields = false
  ;

  SignInResponse._() : super();
  factory SignInResponse() => create();
  factory SignInResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignInResponse clone() => SignInResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignInResponse copyWith(void Function(SignInResponse) updates) => super.copyWith((message) => updates(message as SignInResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignInResponse create() => SignInResponse._();
  SignInResponse createEmptyInstance() => create();
  static $pb.PbList<SignInResponse> createRepeated() => $pb.PbList<SignInResponse>();
  @$core.pragma('dart2js:noInline')
  static SignInResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignInResponse>(create);
  static SignInResponse _defaultInstance;

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
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);

  @$pb.TagNumber(4)
  $0.AccountResponse get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($0.AccountResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  $0.AccountResponse ensureData() => $_ensure(3);
}

class SignUpRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignUpRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'User', protoName: 'User')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PhoneNumber', protoName: 'PhoneNumber')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PassWord', protoName: 'PassWord')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Device', protoName: 'Device')
    ..hasRequiredFields = false
  ;

  SignUpRequest._() : super();
  factory SignUpRequest() => create();
  factory SignUpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignUpRequest clone() => SignUpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignUpRequest copyWith(void Function(SignUpRequest) updates) => super.copyWith((message) => updates(message as SignUpRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignUpRequest create() => SignUpRequest._();
  SignUpRequest createEmptyInstance() => create();
  static $pb.PbList<SignUpRequest> createRepeated() => $pb.PbList<SignUpRequest>();
  @$core.pragma('dart2js:noInline')
  static SignUpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpRequest>(create);
  static SignUpRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get user => $_getSZ(0);
  @$pb.TagNumber(1)
  set user($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get phoneNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set phoneNumber($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoneNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoneNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get passWord => $_getSZ(2);
  @$pb.TagNumber(3)
  set passWord($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassWord() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassWord() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get device => $_getSZ(3);
  @$pb.TagNumber(4)
  set device($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDevice() => $_has(3);
  @$pb.TagNumber(4)
  void clearDevice() => clearField(4);
}

class SignUpResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignUpResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  SignUpResponse._() : super();
  factory SignUpResponse() => create();
  factory SignUpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignUpResponse clone() => SignUpResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignUpResponse copyWith(void Function(SignUpResponse) updates) => super.copyWith((message) => updates(message as SignUpResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignUpResponse create() => SignUpResponse._();
  SignUpResponse createEmptyInstance() => create();
  static $pb.PbList<SignUpResponse> createRepeated() => $pb.PbList<SignUpResponse>();
  @$core.pragma('dart2js:noInline')
  static SignUpResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpResponse>(create);
  static SignUpResponse _defaultInstance;

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

class ResourceData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResourceData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResourceId', protoName: 'ResourceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResourceAddress', protoName: 'ResourceAddress')
    ..hasRequiredFields = false
  ;

  ResourceData._() : super();
  factory ResourceData() => create();
  factory ResourceData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourceData clone() => ResourceData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourceData copyWith(void Function(ResourceData) updates) => super.copyWith((message) => updates(message as ResourceData)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResourceData create() => ResourceData._();
  ResourceData createEmptyInstance() => create();
  static $pb.PbList<ResourceData> createRepeated() => $pb.PbList<ResourceData>();
  @$core.pragma('dart2js:noInline')
  static ResourceData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceData>(create);
  static ResourceData _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resourceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set resourceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResourceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resourceAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set resourceAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResourceAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceAddress() => clearField(2);
}

class ResourceDownloadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResourceDownloadRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UserId', protoName: 'UserId')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResourceId', protoName: 'ResourceId')
    ..hasRequiredFields = false
  ;

  ResourceDownloadRequest._() : super();
  factory ResourceDownloadRequest() => create();
  factory ResourceDownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceDownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourceDownloadRequest clone() => ResourceDownloadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourceDownloadRequest copyWith(void Function(ResourceDownloadRequest) updates) => super.copyWith((message) => updates(message as ResourceDownloadRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResourceDownloadRequest create() => ResourceDownloadRequest._();
  ResourceDownloadRequest createEmptyInstance() => create();
  static $pb.PbList<ResourceDownloadRequest> createRepeated() => $pb.PbList<ResourceDownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static ResourceDownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceDownloadRequest>(create);
  static ResourceDownloadRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get resourceId => $_getList(1);
}

class ResourceDownloadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResourceDownloadResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..pc<ResourceData>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Data', $pb.PbFieldType.PM, protoName: 'Data', subBuilder: ResourceData.create)
    ..hasRequiredFields = false
  ;

  ResourceDownloadResponse._() : super();
  factory ResourceDownloadResponse() => create();
  factory ResourceDownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceDownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourceDownloadResponse clone() => ResourceDownloadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourceDownloadResponse copyWith(void Function(ResourceDownloadResponse) updates) => super.copyWith((message) => updates(message as ResourceDownloadResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResourceDownloadResponse create() => ResourceDownloadResponse._();
  ResourceDownloadResponse createEmptyInstance() => create();
  static $pb.PbList<ResourceDownloadResponse> createRepeated() => $pb.PbList<ResourceDownloadResponse>();
  @$core.pragma('dart2js:noInline')
  static ResourceDownloadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceDownloadResponse>(create);
  static ResourceDownloadResponse _defaultInstance;

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
  $core.List<ResourceData> get data => $_getList(2);
}

class ResourcePreviewRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResourcePreviewRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UserId', protoName: 'UserId')
    ..pc<ResourceData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Data', $pb.PbFieldType.PM, protoName: 'Data', subBuilder: ResourceData.create)
    ..hasRequiredFields = false
  ;

  ResourcePreviewRequest._() : super();
  factory ResourcePreviewRequest() => create();
  factory ResourcePreviewRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourcePreviewRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourcePreviewRequest clone() => ResourcePreviewRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourcePreviewRequest copyWith(void Function(ResourcePreviewRequest) updates) => super.copyWith((message) => updates(message as ResourcePreviewRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResourcePreviewRequest create() => ResourcePreviewRequest._();
  ResourcePreviewRequest createEmptyInstance() => create();
  static $pb.PbList<ResourcePreviewRequest> createRepeated() => $pb.PbList<ResourcePreviewRequest>();
  @$core.pragma('dart2js:noInline')
  static ResourcePreviewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourcePreviewRequest>(create);
  static ResourcePreviewRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ResourceData> get data => $_getList(1);
}

class ResourcePreviewResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResourcePreviewResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..pc<ResourceData>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Data', $pb.PbFieldType.PM, protoName: 'Data', subBuilder: ResourceData.create)
    ..hasRequiredFields = false
  ;

  ResourcePreviewResponse._() : super();
  factory ResourcePreviewResponse() => create();
  factory ResourcePreviewResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourcePreviewResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourcePreviewResponse clone() => ResourcePreviewResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourcePreviewResponse copyWith(void Function(ResourcePreviewResponse) updates) => super.copyWith((message) => updates(message as ResourcePreviewResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResourcePreviewResponse create() => ResourcePreviewResponse._();
  ResourcePreviewResponse createEmptyInstance() => create();
  static $pb.PbList<ResourcePreviewResponse> createRepeated() => $pb.PbList<ResourcePreviewResponse>();
  @$core.pragma('dart2js:noInline')
  static ResourcePreviewResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourcePreviewResponse>(create);
  static ResourcePreviewResponse _defaultInstance;

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
  $core.List<ResourceData> get data => $_getList(2);
}

