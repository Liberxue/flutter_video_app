///
//  Generated code. Do not modify.
//  source: proto/gateWay.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'accountManager.pb.dart' as $0;

import 'common.pbenum.dart' as $4;

class SignInRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignInRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..e<$4.LoginType>(1, 'LoginType', $pb.PbFieldType.OE, protoName: 'LoginType', defaultOrMaker: $4.LoginType.ACCOUNT, valueOf: $4.LoginType.valueOf, enumValues: $4.LoginType.values)
    ..aOS(2, 'User', protoName: 'User')
    ..aInt64(3, 'PhoneNumber', protoName: 'PhoneNumber')
    ..aOS(4, 'PassWord', protoName: 'PassWord')
    ..aOS(5, 'DeviceType', protoName: 'DeviceType')
    ..aOS(6, 'DeviceVersion', protoName: 'DeviceVersion')
    ..hasRequiredFields = false
  ;

  SignInRequest._() : super();
  factory SignInRequest() => create();
  factory SignInRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignInRequest clone() => SignInRequest()..mergeFromMessage(this);
  SignInRequest copyWith(void Function(SignInRequest) updates) => super.copyWith((message) => updates(message as SignInRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignInResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..aOS(3, 'Token', protoName: 'Token')
    ..aOM<$0.AccountResponse>(4, 'Data', protoName: 'Data', subBuilder: $0.AccountResponse.create)
    ..hasRequiredFields = false
  ;

  SignInResponse._() : super();
  factory SignInResponse() => create();
  factory SignInResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignInResponse clone() => SignInResponse()..mergeFromMessage(this);
  SignInResponse copyWith(void Function(SignInResponse) updates) => super.copyWith((message) => updates(message as SignInResponse));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignUpRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'User', protoName: 'User')
    ..aInt64(2, 'PhoneNumber', protoName: 'PhoneNumber')
    ..aOS(3, 'PassWord', protoName: 'PassWord')
    ..aOS(4, 'Device', protoName: 'Device')
    ..hasRequiredFields = false
  ;

  SignUpRequest._() : super();
  factory SignUpRequest() => create();
  factory SignUpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignUpRequest clone() => SignUpRequest()..mergeFromMessage(this);
  SignUpRequest copyWith(void Function(SignUpRequest) updates) => super.copyWith((message) => updates(message as SignUpRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignUpResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  SignUpResponse._() : super();
  factory SignUpResponse() => create();
  factory SignUpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignUpResponse clone() => SignUpResponse()..mergeFromMessage(this);
  SignUpResponse copyWith(void Function(SignUpResponse) updates) => super.copyWith((message) => updates(message as SignUpResponse));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResourceData', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'ResourceId', protoName: 'ResourceId')
    ..aOS(2, 'ResourceAddress', protoName: 'ResourceAddress')
    ..hasRequiredFields = false
  ;

  ResourceData._() : super();
  factory ResourceData() => create();
  factory ResourceData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResourceData clone() => ResourceData()..mergeFromMessage(this);
  ResourceData copyWith(void Function(ResourceData) updates) => super.copyWith((message) => updates(message as ResourceData));
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

class ReourceDownloadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReourceDownloadRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'UserId', protoName: 'UserId')
    ..pPS(2, 'ResourceId', protoName: 'ResourceId')
    ..hasRequiredFields = false
  ;

  ReourceDownloadRequest._() : super();
  factory ReourceDownloadRequest() => create();
  factory ReourceDownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReourceDownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReourceDownloadRequest clone() => ReourceDownloadRequest()..mergeFromMessage(this);
  ReourceDownloadRequest copyWith(void Function(ReourceDownloadRequest) updates) => super.copyWith((message) => updates(message as ReourceDownloadRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReourceDownloadRequest create() => ReourceDownloadRequest._();
  ReourceDownloadRequest createEmptyInstance() => create();
  static $pb.PbList<ReourceDownloadRequest> createRepeated() => $pb.PbList<ReourceDownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static ReourceDownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReourceDownloadRequest>(create);
  static ReourceDownloadRequest _defaultInstance;

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

class ReourceDownloadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReourceDownloadResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..pc<ResourceData>(3, 'Data', $pb.PbFieldType.PM, protoName: 'Data', subBuilder: ResourceData.create)
    ..hasRequiredFields = false
  ;

  ReourceDownloadResponse._() : super();
  factory ReourceDownloadResponse() => create();
  factory ReourceDownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReourceDownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReourceDownloadResponse clone() => ReourceDownloadResponse()..mergeFromMessage(this);
  ReourceDownloadResponse copyWith(void Function(ReourceDownloadResponse) updates) => super.copyWith((message) => updates(message as ReourceDownloadResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReourceDownloadResponse create() => ReourceDownloadResponse._();
  ReourceDownloadResponse createEmptyInstance() => create();
  static $pb.PbList<ReourceDownloadResponse> createRepeated() => $pb.PbList<ReourceDownloadResponse>();
  @$core.pragma('dart2js:noInline')
  static ReourceDownloadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReourceDownloadResponse>(create);
  static ReourceDownloadResponse _defaultInstance;

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

class ReourcePreviewRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReourcePreviewRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'UserId', protoName: 'UserId')
    ..pc<ResourceData>(2, 'Data', $pb.PbFieldType.PM, protoName: 'Data', subBuilder: ResourceData.create)
    ..hasRequiredFields = false
  ;

  ReourcePreviewRequest._() : super();
  factory ReourcePreviewRequest() => create();
  factory ReourcePreviewRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReourcePreviewRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReourcePreviewRequest clone() => ReourcePreviewRequest()..mergeFromMessage(this);
  ReourcePreviewRequest copyWith(void Function(ReourcePreviewRequest) updates) => super.copyWith((message) => updates(message as ReourcePreviewRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReourcePreviewRequest create() => ReourcePreviewRequest._();
  ReourcePreviewRequest createEmptyInstance() => create();
  static $pb.PbList<ReourcePreviewRequest> createRepeated() => $pb.PbList<ReourcePreviewRequest>();
  @$core.pragma('dart2js:noInline')
  static ReourcePreviewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReourcePreviewRequest>(create);
  static ReourcePreviewRequest _defaultInstance;

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

class ReourcePreviewResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReourcePreviewResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$4.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $4.ResponseCode.SUCCESSFUL, valueOf: $4.ResponseCode.valueOf, enumValues: $4.ResponseCode.values)
    ..pc<ResourceData>(3, 'Data', $pb.PbFieldType.PM, protoName: 'Data', subBuilder: ResourceData.create)
    ..hasRequiredFields = false
  ;

  ReourcePreviewResponse._() : super();
  factory ReourcePreviewResponse() => create();
  factory ReourcePreviewResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReourcePreviewResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReourcePreviewResponse clone() => ReourcePreviewResponse()..mergeFromMessage(this);
  ReourcePreviewResponse copyWith(void Function(ReourcePreviewResponse) updates) => super.copyWith((message) => updates(message as ReourcePreviewResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReourcePreviewResponse create() => ReourcePreviewResponse._();
  ReourcePreviewResponse createEmptyInstance() => create();
  static $pb.PbList<ReourcePreviewResponse> createRepeated() => $pb.PbList<ReourcePreviewResponse>();
  @$core.pragma('dart2js:noInline')
  static ReourcePreviewResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReourcePreviewResponse>(create);
  static ReourcePreviewResponse _defaultInstance;

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

