///
//  Generated code. Do not modify.
//  source: proto/accountManager.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'accountManager.pb.dart' as $0;
export 'accountManager.pb.dart';

class AccountManagerClient extends $grpc.Client {
  static final _$createAccount =
      $grpc.ClientMethod<$0.CreateAccountRequest, $0.CreateAccountResponse>(
          '/proto.AccountManager/CreateAccount',
          ($0.CreateAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateAccountResponse.fromBuffer(value));
  static final _$updateProfile =
      $grpc.ClientMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
          '/proto.AccountManager/UpdateProfile',
          ($0.UpdateProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateProfileResponse.fromBuffer(value));
  static final _$updatePassWord =
      $grpc.ClientMethod<$0.UpdatePassWordRequest, $0.UpdatePassWordResponse>(
          '/proto.AccountManager/UpdatePassWord',
          ($0.UpdatePassWordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdatePassWordResponse.fromBuffer(value));
  static final _$loginAccount =
      $grpc.ClientMethod<$0.LoginAccountRequest, $0.LoginAccountResponse>(
          '/proto.AccountManager/LoginAccount',
          ($0.LoginAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LoginAccountResponse.fromBuffer(value));
  static final _$rechargeCoin =
      $grpc.ClientMethod<$0.RechargeCoinRequest, $0.RechargeCoinResponse>(
          '/proto.AccountManager/RechargeCoin',
          ($0.RechargeCoinRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RechargeCoinResponse.fromBuffer(value));

  AccountManagerClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.CreateAccountResponse> createAccount(
      $0.CreateAccountRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateProfileResponse> updateProfile(
      $0.UpdateProfileRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateProfile, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdatePassWordResponse> updatePassWord(
      $0.UpdatePassWordRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updatePassWord, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.LoginAccountResponse> loginAccount(
      $0.LoginAccountRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$loginAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.RechargeCoinResponse> rechargeCoin(
      $0.RechargeCoinRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$rechargeCoin, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AccountManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.AccountManager';

  AccountManagerServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreateAccountRequest, $0.CreateAccountResponse>(
            'CreateAccount',
            createAccount_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateAccountRequest.fromBuffer(value),
            ($0.CreateAccountResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
            'UpdateProfile',
            updateProfile_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateProfileRequest.fromBuffer(value),
            ($0.UpdateProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePassWordRequest,
            $0.UpdatePassWordResponse>(
        'UpdatePassWord',
        updatePassWord_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdatePassWordRequest.fromBuffer(value),
        ($0.UpdatePassWordResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.LoginAccountRequest, $0.LoginAccountResponse>(
            'LoginAccount',
            loginAccount_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.LoginAccountRequest.fromBuffer(value),
            ($0.LoginAccountResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.RechargeCoinRequest, $0.RechargeCoinResponse>(
            'RechargeCoin',
            rechargeCoin_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RechargeCoinRequest.fromBuffer(value),
            ($0.RechargeCoinResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateAccountResponse> createAccount_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateAccountRequest> request) async {
    return createAccount(call, await request);
  }

  $async.Future<$0.UpdateProfileResponse> updateProfile_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateProfileRequest> request) async {
    return updateProfile(call, await request);
  }

  $async.Future<$0.UpdatePassWordResponse> updatePassWord_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdatePassWordRequest> request) async {
    return updatePassWord(call, await request);
  }

  $async.Future<$0.LoginAccountResponse> loginAccount_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.LoginAccountRequest> request) async {
    return loginAccount(call, await request);
  }

  $async.Future<$0.RechargeCoinResponse> rechargeCoin_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RechargeCoinRequest> request) async {
    return rechargeCoin(call, await request);
  }

  $async.Future<$0.CreateAccountResponse> createAccount(
      $grpc.ServiceCall call, $0.CreateAccountRequest request);
  $async.Future<$0.UpdateProfileResponse> updateProfile(
      $grpc.ServiceCall call, $0.UpdateProfileRequest request);
  $async.Future<$0.UpdatePassWordResponse> updatePassWord(
      $grpc.ServiceCall call, $0.UpdatePassWordRequest request);
  $async.Future<$0.LoginAccountResponse> loginAccount(
      $grpc.ServiceCall call, $0.LoginAccountRequest request);
  $async.Future<$0.RechargeCoinResponse> rechargeCoin(
      $grpc.ServiceCall call, $0.RechargeCoinRequest request);
}
