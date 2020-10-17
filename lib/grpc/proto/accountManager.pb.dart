///
//  Generated code. Do not modify.
//  source: proto/accountManager.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pbenum.dart' as $5;

class Account extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Account', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aInt64(2, 'PhoneNumber', protoName: 'PhoneNumber')
    ..aOS(3, 'PassWord', protoName: 'PassWord')
    ..aOS(4, 'DeviceType', protoName: 'DeviceType')
    ..aOS(5, 'DeviceVersion', protoName: 'DeviceVersion')
    ..hasRequiredFields = false
  ;

  Account._() : super();
  factory Account() => create();
  factory Account.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Account clone() => Account()..mergeFromMessage(this);
  Account copyWith(void Function(Account) updates) => super.copyWith((message) => updates(message as Account));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Account create() => Account._();
  Account createEmptyInstance() => create();
  static $pb.PbList<Account> createRepeated() => $pb.PbList<Account>();
  @$core.pragma('dart2js:noInline')
  static Account getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account>(create);
  static Account _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get phoneNumber => $_getI64(0);
  @$pb.TagNumber(2)
  set phoneNumber($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(2)
  void clearPhoneNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get passWord => $_getSZ(1);
  @$pb.TagNumber(3)
  set passWord($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassWord() => $_has(1);
  @$pb.TagNumber(3)
  void clearPassWord() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceType => $_getSZ(2);
  @$pb.TagNumber(4)
  set deviceType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceType() => $_has(2);
  @$pb.TagNumber(4)
  void clearDeviceType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceVersion => $_getSZ(3);
  @$pb.TagNumber(5)
  set deviceVersion($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceVersion() => $_has(3);
  @$pb.TagNumber(5)
  void clearDeviceVersion() => clearField(5);
}

class AccountResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Id', protoName: 'Id')
    ..aOS(2, 'Name', protoName: 'Name')
    ..aOS(3, 'AvatarImage', protoName: 'AvatarImage')
    ..aInt64(4, 'PhoneNumber', protoName: 'PhoneNumber')
    ..aInt64(5, 'Coin', protoName: 'Coin')
    ..aOS(6, 'AccountLevel', protoName: 'AccountLevel')
    ..a<$core.int>(7, 'Status', $pb.PbFieldType.O3, protoName: 'Status')
    ..hasRequiredFields = false
  ;

  AccountResponse._() : super();
  factory AccountResponse() => create();
  factory AccountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountResponse clone() => AccountResponse()..mergeFromMessage(this);
  AccountResponse copyWith(void Function(AccountResponse) updates) => super.copyWith((message) => updates(message as AccountResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountResponse create() => AccountResponse._();
  AccountResponse createEmptyInstance() => create();
  static $pb.PbList<AccountResponse> createRepeated() => $pb.PbList<AccountResponse>();
  @$core.pragma('dart2js:noInline')
  static AccountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountResponse>(create);
  static AccountResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatarImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatarImage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvatarImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatarImage() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get phoneNumber => $_getI64(3);
  @$pb.TagNumber(4)
  set phoneNumber($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get coin => $_getI64(4);
  @$pb.TagNumber(5)
  set coin($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCoin() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoin() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get accountLevel => $_getSZ(5);
  @$pb.TagNumber(6)
  set accountLevel($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAccountLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearAccountLevel() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get status => $_getIZ(6);
  @$pb.TagNumber(7)
  set status($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);
}

class CreateAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateAccountRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOM<Account>(1, 'Account', protoName: 'Account', subBuilder: Account.create)
    ..hasRequiredFields = false
  ;

  CreateAccountRequest._() : super();
  factory CreateAccountRequest() => create();
  factory CreateAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateAccountRequest clone() => CreateAccountRequest()..mergeFromMessage(this);
  CreateAccountRequest copyWith(void Function(CreateAccountRequest) updates) => super.copyWith((message) => updates(message as CreateAccountRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateAccountRequest create() => CreateAccountRequest._();
  CreateAccountRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAccountRequest> createRepeated() => $pb.PbList<CreateAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAccountRequest>(create);
  static CreateAccountRequest _defaultInstance;

  @$pb.TagNumber(1)
  Account get account => $_getN(0);
  @$pb.TagNumber(1)
  set account(Account v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  Account ensureAccount() => $_ensure(0);
}

class CreateAccountResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateAccountResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  CreateAccountResponse._() : super();
  factory CreateAccountResponse() => create();
  factory CreateAccountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAccountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateAccountResponse clone() => CreateAccountResponse()..mergeFromMessage(this);
  CreateAccountResponse copyWith(void Function(CreateAccountResponse) updates) => super.copyWith((message) => updates(message as CreateAccountResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateAccountResponse create() => CreateAccountResponse._();
  CreateAccountResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAccountResponse> createRepeated() => $pb.PbList<CreateAccountResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAccountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAccountResponse>(create);
  static CreateAccountResponse _defaultInstance;

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

class LoginAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LoginAccountRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOM<Account>(1, 'Account', protoName: 'Account', subBuilder: Account.create)
    ..hasRequiredFields = false
  ;

  LoginAccountRequest._() : super();
  factory LoginAccountRequest() => create();
  factory LoginAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LoginAccountRequest clone() => LoginAccountRequest()..mergeFromMessage(this);
  LoginAccountRequest copyWith(void Function(LoginAccountRequest) updates) => super.copyWith((message) => updates(message as LoginAccountRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginAccountRequest create() => LoginAccountRequest._();
  LoginAccountRequest createEmptyInstance() => create();
  static $pb.PbList<LoginAccountRequest> createRepeated() => $pb.PbList<LoginAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginAccountRequest>(create);
  static LoginAccountRequest _defaultInstance;

  @$pb.TagNumber(1)
  Account get account => $_getN(0);
  @$pb.TagNumber(1)
  set account(Account v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  Account ensureAccount() => $_ensure(0);
}

class LoginAccountResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LoginAccountResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..aOM<AccountResponse>(3, 'Data', protoName: 'Data', subBuilder: AccountResponse.create)
    ..hasRequiredFields = false
  ;

  LoginAccountResponse._() : super();
  factory LoginAccountResponse() => create();
  factory LoginAccountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginAccountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LoginAccountResponse clone() => LoginAccountResponse()..mergeFromMessage(this);
  LoginAccountResponse copyWith(void Function(LoginAccountResponse) updates) => super.copyWith((message) => updates(message as LoginAccountResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginAccountResponse create() => LoginAccountResponse._();
  LoginAccountResponse createEmptyInstance() => create();
  static $pb.PbList<LoginAccountResponse> createRepeated() => $pb.PbList<LoginAccountResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginAccountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginAccountResponse>(create);
  static LoginAccountResponse _defaultInstance;

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
  AccountResponse get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AccountResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AccountResponse ensureData() => $_ensure(2);
}

class UpdateProfileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateProfileRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Id', protoName: 'Id')
    ..aOS(2, 'Name', protoName: 'Name')
    ..aOS(3, 'AvatarImage', protoName: 'AvatarImage')
    ..aInt64(4, 'PhoneNumber', protoName: 'PhoneNumber')
    ..hasRequiredFields = false
  ;

  UpdateProfileRequest._() : super();
  factory UpdateProfileRequest() => create();
  factory UpdateProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateProfileRequest clone() => UpdateProfileRequest()..mergeFromMessage(this);
  UpdateProfileRequest copyWith(void Function(UpdateProfileRequest) updates) => super.copyWith((message) => updates(message as UpdateProfileRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateProfileRequest create() => UpdateProfileRequest._();
  UpdateProfileRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProfileRequest> createRepeated() => $pb.PbList<UpdateProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfileRequest>(create);
  static UpdateProfileRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatarImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatarImage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvatarImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatarImage() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get phoneNumber => $_getI64(3);
  @$pb.TagNumber(4)
  set phoneNumber($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => clearField(4);
}

class UpdateProfileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateProfileResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  UpdateProfileResponse._() : super();
  factory UpdateProfileResponse() => create();
  factory UpdateProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateProfileResponse clone() => UpdateProfileResponse()..mergeFromMessage(this);
  UpdateProfileResponse copyWith(void Function(UpdateProfileResponse) updates) => super.copyWith((message) => updates(message as UpdateProfileResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateProfileResponse create() => UpdateProfileResponse._();
  UpdateProfileResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProfileResponse> createRepeated() => $pb.PbList<UpdateProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfileResponse>(create);
  static UpdateProfileResponse _defaultInstance;

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

class UpdatePassWordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdatePassWordRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOM<Account>(1, 'Account', protoName: 'Account', subBuilder: Account.create)
    ..hasRequiredFields = false
  ;

  UpdatePassWordRequest._() : super();
  factory UpdatePassWordRequest() => create();
  factory UpdatePassWordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePassWordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdatePassWordRequest clone() => UpdatePassWordRequest()..mergeFromMessage(this);
  UpdatePassWordRequest copyWith(void Function(UpdatePassWordRequest) updates) => super.copyWith((message) => updates(message as UpdatePassWordRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePassWordRequest create() => UpdatePassWordRequest._();
  UpdatePassWordRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePassWordRequest> createRepeated() => $pb.PbList<UpdatePassWordRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePassWordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePassWordRequest>(create);
  static UpdatePassWordRequest _defaultInstance;

  @$pb.TagNumber(1)
  Account get account => $_getN(0);
  @$pb.TagNumber(1)
  set account(Account v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  Account ensureAccount() => $_ensure(0);
}

class UpdatePassWordResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdatePassWordResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  UpdatePassWordResponse._() : super();
  factory UpdatePassWordResponse() => create();
  factory UpdatePassWordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePassWordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdatePassWordResponse clone() => UpdatePassWordResponse()..mergeFromMessage(this);
  UpdatePassWordResponse copyWith(void Function(UpdatePassWordResponse) updates) => super.copyWith((message) => updates(message as UpdatePassWordResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePassWordResponse create() => UpdatePassWordResponse._();
  UpdatePassWordResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePassWordResponse> createRepeated() => $pb.PbList<UpdatePassWordResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePassWordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePassWordResponse>(create);
  static UpdatePassWordResponse _defaultInstance;

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

class RechargeCoinRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RechargeCoinRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Id', protoName: 'Id')
    ..aInt64(5, 'Coin', protoName: 'Coin')
    ..hasRequiredFields = false
  ;

  RechargeCoinRequest._() : super();
  factory RechargeCoinRequest() => create();
  factory RechargeCoinRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RechargeCoinRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RechargeCoinRequest clone() => RechargeCoinRequest()..mergeFromMessage(this);
  RechargeCoinRequest copyWith(void Function(RechargeCoinRequest) updates) => super.copyWith((message) => updates(message as RechargeCoinRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RechargeCoinRequest create() => RechargeCoinRequest._();
  RechargeCoinRequest createEmptyInstance() => create();
  static $pb.PbList<RechargeCoinRequest> createRepeated() => $pb.PbList<RechargeCoinRequest>();
  @$core.pragma('dart2js:noInline')
  static RechargeCoinRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RechargeCoinRequest>(create);
  static RechargeCoinRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(5)
  $fixnum.Int64 get coin => $_getI64(1);
  @$pb.TagNumber(5)
  set coin($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(5)
  $core.bool hasCoin() => $_has(1);
  @$pb.TagNumber(5)
  void clearCoin() => clearField(5);
}

class RechargeCoinResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RechargeCoinResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<$5.ResponseCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..hasRequiredFields = false
  ;

  RechargeCoinResponse._() : super();
  factory RechargeCoinResponse() => create();
  factory RechargeCoinResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RechargeCoinResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RechargeCoinResponse clone() => RechargeCoinResponse()..mergeFromMessage(this);
  RechargeCoinResponse copyWith(void Function(RechargeCoinResponse) updates) => super.copyWith((message) => updates(message as RechargeCoinResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RechargeCoinResponse create() => RechargeCoinResponse._();
  RechargeCoinResponse createEmptyInstance() => create();
  static $pb.PbList<RechargeCoinResponse> createRepeated() => $pb.PbList<RechargeCoinResponse>();
  @$core.pragma('dart2js:noInline')
  static RechargeCoinResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RechargeCoinResponse>(create);
  static RechargeCoinResponse _defaultInstance;

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

