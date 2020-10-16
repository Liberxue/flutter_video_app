///
//  Generated code. Do not modify.
//  source: proto/gateWay.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'accountManager.pb.dart' as $0;

import 'common.pbenum.dart' as $5;

class LoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LoginRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..e<$5.LoginType>(1, 'LoginType', $pb.PbFieldType.OE, protoName: 'LoginType', defaultOrMaker: $5.LoginType.ACCOUNT, valueOf: $5.LoginType.valueOf, enumValues: $5.LoginType.values)
    ..aOS(2, 'User', protoName: 'User')
    ..aOS(3, 'PhoneNumber', protoName: 'PhoneNumber')
    ..aOS(4, 'PassWord', protoName: 'PassWord')
    ..aOS(5, 'DeviceType', protoName: 'DeviceType')
    ..aOS(6, 'DeviceVersion', protoName: 'DeviceVersion')
    ..hasRequiredFields = false
  ;

  LoginRequest._() : super();
  factory LoginRequest() => create();
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest _defaultInstance;

  @$pb.TagNumber(1)
  $5.LoginType get loginType => $_getN(0);
  @$pb.TagNumber(1)
  set loginType($5.LoginType v) { setField(1, v); }
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
  $core.String get phoneNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set phoneNumber($core.String v) { $_setString(2, v); }
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

class LoginResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LoginResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..aOS(3, 'Token', protoName: 'Token')
    ..aOM<$0.AccountResponse>(4, 'Data', protoName: 'Data', subBuilder: $0.AccountResponse.create)
    ..hasRequiredFields = false
  ;

  LoginResponse._() : super();
  factory LoginResponse() => create();
  factory LoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LoginResponse clone() => LoginResponse()..mergeFromMessage(this);
  LoginResponse copyWith(void Function(LoginResponse) updates) => super.copyWith((message) => updates(message as LoginResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  LoginResponse createEmptyInstance() => create();
  static $pb.PbList<LoginResponse> createRepeated() => $pb.PbList<LoginResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse _defaultInstance;

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

class SignInRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignInRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'User', protoName: 'User')
    ..aOS(2, 'PassWord', protoName: 'PassWord')
    ..aOS(3, 'Device', protoName: 'Device')
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
  $core.String get user => $_getSZ(0);
  @$pb.TagNumber(1)
  set user($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get passWord => $_getSZ(1);
  @$pb.TagNumber(2)
  set passWord($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassWord() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassWord() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get device => $_getSZ(2);
  @$pb.TagNumber(3)
  set device($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDevice() => $_has(2);
  @$pb.TagNumber(3)
  void clearDevice() => clearField(3);
}

class SignInResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignInResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
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
  $5.ResponseCode get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($5.ResponseCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class FavoriteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'ResourceID', protoName: 'ResourceID')
    ..aOB(2, 'IsFavorite', protoName: 'IsFavorite')
    ..hasRequiredFields = false
  ;

  FavoriteRequest._() : super();
  factory FavoriteRequest() => create();
  factory FavoriteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteRequest clone() => FavoriteRequest()..mergeFromMessage(this);
  FavoriteRequest copyWith(void Function(FavoriteRequest) updates) => super.copyWith((message) => updates(message as FavoriteRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteRequest create() => FavoriteRequest._();
  FavoriteRequest createEmptyInstance() => create();
  static $pb.PbList<FavoriteRequest> createRepeated() => $pb.PbList<FavoriteRequest>();
  @$core.pragma('dart2js:noInline')
  static FavoriteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteRequest>(create);
  static FavoriteRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resourceID => $_getSZ(0);
  @$pb.TagNumber(1)
  set resourceID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResourceID() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceID() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isFavorite => $_getBF(1);
  @$pb.TagNumber(2)
  set isFavorite($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsFavorite() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsFavorite() => clearField(2);
}

class FavoriteResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FavoriteResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'code', $pb.PbFieldType.OE, defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  FavoriteResponse._() : super();
  factory FavoriteResponse() => create();
  factory FavoriteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FavoriteResponse clone() => FavoriteResponse()..mergeFromMessage(this);
  FavoriteResponse copyWith(void Function(FavoriteResponse) updates) => super.copyWith((message) => updates(message as FavoriteResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteResponse create() => FavoriteResponse._();
  FavoriteResponse createEmptyInstance() => create();
  static $pb.PbList<FavoriteResponse> createRepeated() => $pb.PbList<FavoriteResponse>();
  @$core.pragma('dart2js:noInline')
  static FavoriteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteResponse>(create);
  static FavoriteResponse _defaultInstance;

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

