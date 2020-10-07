///
//  Generated code. Do not modify.
//  source: proto/gateWay.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'gateWay.pb.dart' as $0;
import 'search.pb.dart' as $1;
export 'gateWay.pb.dart';

class GateWayServerClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/proto.GateWayServer/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$signIn =
      $grpc.ClientMethod<$0.SignInRequest, $0.SignInResponse>(
          '/proto.GateWayServer/SignIn',
          ($0.SignInRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignInResponse.fromBuffer(value));
  static final _$search =
      $grpc.ClientMethod<$1.SearchRequest, $1.SearchResponse>(
          '/proto.GateWayServer/Search',
          ($1.SearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SearchResponse.fromBuffer(value));
  static final _$favorite =
      $grpc.ClientMethod<$0.FavoriteRequest, $0.FavoriteResponse>(
          '/proto.GateWayServer/Favorite',
          ($0.FavoriteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.FavoriteResponse.fromBuffer(value));

  GateWayServerClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$login, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.SignInResponse> signIn($0.SignInRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signIn, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.SearchResponse> search($1.SearchRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$search, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FavoriteResponse> favorite($0.FavoriteRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$favorite, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GateWayServerServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.GateWayServer';

  GateWayServerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignInRequest, $0.SignInResponse>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignInRequest.fromBuffer(value),
        ($0.SignInResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SearchRequest, $1.SearchResponse>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SearchRequest.fromBuffer(value),
        ($1.SearchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FavoriteRequest, $0.FavoriteResponse>(
        'Favorite',
        favorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FavoriteRequest.fromBuffer(value),
        ($0.FavoriteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.SignInResponse> signIn_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignInRequest> request) async {
    return signIn(call, await request);
  }

  $async.Future<$1.SearchResponse> search_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$0.FavoriteResponse> favorite_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FavoriteRequest> request) async {
    return favorite(call, await request);
  }

  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.SignInResponse> signIn(
      $grpc.ServiceCall call, $0.SignInRequest request);
  $async.Future<$1.SearchResponse> search(
      $grpc.ServiceCall call, $1.SearchRequest request);
  $async.Future<$0.FavoriteResponse> favorite(
      $grpc.ServiceCall call, $0.FavoriteRequest request);
}
